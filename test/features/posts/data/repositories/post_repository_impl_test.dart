import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:json_placeholder_test/core/error/failure.dart';
import 'package:json_placeholder_test/features/posts/data/datasources/post_local_data_source.dart';
import 'package:json_placeholder_test/features/posts/data/datasources/post_remote_data_source.dart';
import 'package:json_placeholder_test/features/posts/data/dtos/post_dto.dart';
import 'package:json_placeholder_test/features/posts/data/exceptions/remote_parsing_exception.dart';
import 'package:json_placeholder_test/features/posts/data/repositories/post_repository_impl.dart';
import 'package:json_placeholder_test/features/posts/domain/entities/post.dart';
import 'package:json_placeholder_test/features/posts/domain/entities/post_draft.dart';
import 'package:json_placeholder_test/features/posts/domain/entities/post_feed.dart';
import 'package:mocktail/mocktail.dart';

class _MockRemote extends Mock implements PostRemoteDataSource {}

class _MockLocal extends Mock implements PostLocalDataSource {}

void main() {
  late _MockRemote remote;
  late _MockLocal local;
  late PostRepositoryImpl repository;

  final now = DateTime.utc(2026, 6, 1, 12);
  var uuidCounter = 0;

  const draft = PostDraft(title: 'Meu post', body: 'Minha descrição');

  const dtos = [
    PostDto(userId: 1, id: 1, title: 'um', body: 'corpo um'),
    PostDto(userId: 2, id: 2, title: 'dois', body: 'corpo dois'),
  ];

  Post cachedPost(String id) => Post(
    id: id,
    userId: 1,
    title: id,
    body: 'corpo',
    origin: PostOrigin.remote,
    createdAt: now,
    remoteId: 1,
  );

  final dioFailure = DioException(
    requestOptions: RequestOptions(path: '/posts'),
    type: DioExceptionType.connectionError,
  );

  setUpAll(() {
    registerFallbackValue(const PostDraft(title: 't', body: 'b'));
    registerFallbackValue(<Post>[]);
    registerFallbackValue(
      Post(
        id: 'x',
        userId: 1,
        title: 't',
        body: 'b',
        origin: PostOrigin.local,
        createdAt: DateTime.utc(2026),
      ),
    );
  });

  setUp(() {
    uuidCounter = 0;
    remote = _MockRemote();
    local = _MockLocal();
    repository = PostRepositoryImpl(
      remoteDataSource: remote,
      localDataSource: local,
      now: () => now,
      newId: () => 'uuid-${++uuidCounter}',
    );
    when(() => local.replaceRemoteCache(any())).thenAnswer((_) async {});
    when(() => local.saveLocalPost(any())).thenAnswer((_) async {});
  });

  group('getPosts', () {
    test('caches the API response and returns the merged local list', () async {
      when(remote.fetchPosts).thenAnswer((_) async => dtos);
      when(local.readAll).thenAnswer((_) async => [cachedPost('remote-1')]);

      final result = await repository.getPosts();

      final feed = result.getRight().toNullable()!;
      expect(feed.source, PostFeedSource.network);
      expect(feed.syncFailure, isNull);
      expect(feed.posts.map((p) => p.id), ['remote-1']);

      final cached =
          verify(() => local.replaceRemoteCache(captureAny())).captured.single
              as List<Post>;
      expect(cached.map((p) => p.remoteId), [1, 2]);
      expect(cached.every((p) => p.origin == PostOrigin.remote), isTrue);
    });

    test(
      'reads the list from the database, not from the API response',
      () async {
        when(remote.fetchPosts).thenAnswer((_) async => dtos);
        when(local.readAll).thenAnswer((_) async => [cachedPost('local-1')]);

        final result = await repository.getPosts();

        expect(result.getRight().toNullable()!.posts.single.id, 'local-1');
        verify(local.readAll).called(1);
      },
    );

    test('falls back to the cache when the network fails', () async {
      when(remote.fetchPosts).thenThrow(dioFailure);
      when(local.readAll).thenAnswer((_) async => [cachedPost('remote-1')]);

      final result = await repository.getPosts();

      final feed = result.getRight().toNullable()!;
      expect(feed.source, PostFeedSource.cache);
      expect(feed.syncFailure, const Failure.noConnection());
      expect(feed.isStale, isTrue);
      expect(feed.posts, hasLength(1));
      verifyNever(() => local.replaceRemoteCache(any()));
    });

    test('fails when the network fails and there is nothing cached', () async {
      when(remote.fetchPosts).thenThrow(dioFailure);
      when(local.readAll).thenAnswer((_) async => []);

      final result = await repository.getPosts();

      expect(result.getLeft().toNullable(), const Failure.noConnection());
    });

    test('maps a malformed payload to a serialization failure', () async {
      when(remote.fetchPosts).thenThrow(const RemoteParsingException('bad'));
      when(local.readAll).thenAnswer((_) async => []);

      final result = await repository.getPosts();

      expect(result.getLeft().toNullable(), isA<SerializationFailure>());
    });

    test('reports a cache failure when the database itself breaks', () async {
      when(remote.fetchPosts).thenAnswer((_) async => dtos);
      when(local.readAll).thenThrow(Exception('disk is on fire'));

      final result = await repository.getPosts();

      expect(result.getLeft().toNullable(), isA<CacheFailure>());
    });
  });

  group('create', () {
    setUp(() {
      when(() => remote.createPost(any())).thenAnswer(
        (_) async => const PostDto(
          userId: 1,
          id: 101,
          title: 'Meu post',
          body: 'Minha descrição',
        ),
      );
    });

    test('sends the draft to the API', () async {
      await repository.create(draft);

      verify(() => remote.createPost(draft)).called(1);
    });

    test('stores the created post locally with its own identity', () async {
      final result = await repository.create(draft);

      final post = result.getRight().toNullable()!;
      expect(post.origin, PostOrigin.local);
      expect(post.id, 'local-uuid-1');
      expect(post.createdAt, now);
      expect(post.title, 'Meu post');

      final saved =
          verify(() => local.saveLocalPost(captureAny())).captured.single
              as Post;
      expect(saved, post);
    });

    test('keeps the id returned by the API for traceability', () async {
      final result = await repository.create(draft);

      expect(result.getRight().toNullable()!.remoteId, 101);
    });

    test('does not collide with the cache key of a remote post', () async {
      final result = await repository.create(draft);

      expect(
        result.getRight().toNullable()!.id,
        isNot(Post.remoteIdToLocalKey(101)),
      );
    });

    test('does not persist anything when the API call fails', () async {
      when(() => remote.createPost(any())).thenThrow(dioFailure);

      final result = await repository.create(draft);

      expect(result.getLeft().toNullable(), const Failure.noConnection());
      verifyNever(() => local.saveLocalPost(any()));
    });

    test('reports a cache failure when the local write fails', () async {
      when(() => local.saveLocalPost(any())).thenThrow(Exception('no disk'));

      final result = await repository.create(draft);

      expect(result.getLeft().toNullable(), isA<CacheFailure>());
    });
  });

  group('getById', () {
    test('returns the stored post', () async {
      when(
        () => local.findById('remote-1'),
      ).thenAnswer((_) async => cachedPost('remote-1'));

      final result = await repository.getById('remote-1');

      expect(result.getRight().toNullable()!.id, 'remote-1');
    });

    test('fails when the post is unknown', () async {
      when(() => local.findById(any())).thenAnswer((_) async => null);

      final result = await repository.getById('nope');

      expect(result.getLeft().toNullable(), isA<CacheFailure>());
    });
  });
}
