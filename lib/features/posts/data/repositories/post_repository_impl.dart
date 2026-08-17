import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/network/network_failure_mapper.dart';
import '../../../../core/typedefs.dart';
import '../../domain/entities/post.dart';
import '../../domain/entities/post_draft.dart';
import '../../domain/entities/post_feed.dart';
import '../../domain/repositories/post_repository.dart';
import '../datasources/post_local_data_source.dart';
import '../datasources/post_remote_data_source.dart';
import '../exceptions/remote_parsing_exception.dart';

class PostRepositoryImpl implements PostRepository {
  PostRepositoryImpl({
    required PostRemoteDataSource remoteDataSource,
    required PostLocalDataSource localDataSource,
    DateTime Function()? now,
    String Function()? newId,
  }) : _remote = remoteDataSource,
       _local = localDataSource,
       _now = now ?? DateTime.now,
       _newId = newId ?? const Uuid().v4;

  final PostRemoteDataSource _remote;
  final PostLocalDataSource _local;

  final DateTime Function() _now;
  final String Function() _newId;

  @override
  Future<Result<PostFeed>> getPosts() async {
    Failure? syncFailure;

    try {
      final dtos = await _remote.fetchPosts();
      final fetchedAt = _now();
      await _local.replaceRemoteCache(
        dtos.map((dto) => dto.toRemotePost(createdAt: fetchedAt)).toList(),
      );
    } on DioException catch (error) {
      syncFailure = NetworkFailureMapper.fromDioException(error);
    } on RemoteParsingException catch (error) {
      syncFailure = Failure.serialization(error.details);
    } on Object catch (error) {
      syncFailure = Failure.unexpected(error.toString());
    }

    final List<Post> posts;
    try {
      posts = await _local.readAll();
    } on Object catch (error) {
      return Left(Failure.cache(error.toString()));
    }

    if (syncFailure == null) {
      return Right(PostFeed(posts: posts, source: PostFeedSource.network));
    }

    if (posts.isEmpty) {
      return Left(syncFailure);
    }

    return Right(
      PostFeed(
        posts: posts,
        source: PostFeedSource.cache,
        syncFailure: syncFailure,
      ),
    );
  }

  @override
  Future<Result<Post>> create(PostDraft draft) async {
    final int? remoteId;
    try {
      final dto = await _remote.createPost(draft);
      remoteId = dto.id;
    } on DioException catch (error) {
      return Left(NetworkFailureMapper.fromDioException(error));
    } on RemoteParsingException catch (error) {
      return Left(Failure.serialization(error.details));
    } on Object catch (error) {
      return Left(Failure.unexpected(error.toString()));
    }

    final post = Post(
      id: 'local-${_newId()}',
      userId: draft.userId,
      title: draft.title,
      body: draft.body,
      origin: PostOrigin.local,
      createdAt: _now(),
      remoteId: remoteId,
    );

    try {
      await _local.saveLocalPost(post);
    } on Object catch (error) {
      return Left(Failure.cache(error.toString()));
    }

    return Right(post);
  }

  @override
  Future<Result<Post>> getById(String id) async {
    try {
      final post = await _local.findById(id);
      if (post == null) {
        return Left(Failure.cache('Post $id não está salvo no dispositivo.'));
      }
      return Right(post);
    } on Object catch (error) {
      return Left(Failure.cache(error.toString()));
    }
  }
}
