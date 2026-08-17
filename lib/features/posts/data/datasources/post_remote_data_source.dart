import 'package:dio/dio.dart';

import '../../../../core/network/api_endpoints.dart';
import '../../domain/entities/post_draft.dart';
import '../dtos/post_dto.dart';
import '../exceptions/remote_parsing_exception.dart';

abstract interface class PostRemoteDataSource {
  Future<List<PostDto>> fetchPosts();

  Future<PostDto> createPost(PostDraft draft);
}

class DioPostRemoteDataSource implements PostRemoteDataSource {
  const DioPostRemoteDataSource(this._dio);

  final Dio _dio;

  @override
  Future<List<PostDto>> fetchPosts() async {
    final response = await _dio.get<Object?>(ApiEndpoints.posts);
    final data = response.data;

    if (data is! List) {
      throw RemoteParsingException(
        'Esperava uma lista em ${ApiEndpoints.posts}, recebi ${data.runtimeType}.',
      );
    }

    return data.map(_parseItem).toList(growable: false);
  }

  @override
  Future<PostDto> createPost(PostDraft draft) async {
    final response = await _dio.post<Object?>(
      ApiEndpoints.posts,
      data: PostDto.createBody(
        userId: draft.userId,
        title: draft.title,
        body: draft.body,
      ),
    );

    return _parseItem(response.data);
  }

  PostDto _parseItem(Object? item) {
    if (item is! Map<String, dynamic>) {
      throw RemoteParsingException('Item não é um objeto JSON: $item');
    }
    try {
      return PostDto.fromJson(item);
    } on Object catch (error) {
      throw RemoteParsingException(
        'Campo inválido ou ausente em $item ($error)',
      );
    }
  }
}
