import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:json_placeholder_test/core/network/api_endpoints.dart';
import 'package:json_placeholder_test/features/posts/data/datasources/post_remote_data_source.dart';
import 'package:json_placeholder_test/features/posts/data/exceptions/remote_parsing_exception.dart';
import 'package:json_placeholder_test/features/posts/domain/entities/post_draft.dart';

class _RecordingAdapter implements HttpClientAdapter {
  _RecordingAdapter(this.respond);

  final ResponseBody Function(RequestOptions options) respond;
  final List<RequestOptions> requests = [];

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requests.add(options);
    return respond(options);
  }

  @override
  void close({bool force = false}) {}
}

ResponseBody jsonResponse(Object? body, {int statusCode = 200}) {
  return ResponseBody.fromString(
    jsonEncode(body),
    statusCode,
    headers: {
      Headers.contentTypeHeader: [Headers.jsonContentType],
    },
  );
}

void main() {
  late _RecordingAdapter adapter;
  late Dio dio;
  late PostRemoteDataSource dataSource;

  void arrange(ResponseBody Function(RequestOptions options) respond) {
    adapter = _RecordingAdapter(respond);
    dio = Dio(BaseOptions(baseUrl: ApiEndpoints.baseUrl))
      ..httpClientAdapter = adapter;
    dataSource = DioPostRemoteDataSource(dio);
  }

  group('fetchPosts', () {
    test('GETs the posts collection and parses it', () async {
      arrange(
        (_) => jsonResponse([
          {'userId': 1, 'id': 1, 'title': 'a', 'body': 'b'},
          {'userId': 2, 'id': 2, 'title': 'c', 'body': 'd'},
        ]),
      );

      final dtos = await dataSource.fetchPosts();

      expect(dtos.map((e) => e.id), [1, 2]);
      expect(adapter.requests.single.method, 'GET');
      expect(adapter.requests.single.path, ApiEndpoints.posts);
    });

    test('surfaces HTTP errors as DioException', () async {
      arrange((_) => jsonResponse({'error': 'boom'}, statusCode: 500));

      expect(dataSource.fetchPosts, throwsA(isA<DioException>()));
    });

    test('throws RemoteParsingException when the payload is not a list', () {
      arrange((_) => jsonResponse({'unexpected': true}));

      expect(dataSource.fetchPosts, throwsA(isA<RemoteParsingException>()));
    });

    test('throws RemoteParsingException when an item misses a field', () {
      arrange(
        (_) => jsonResponse([
          {'userId': 1, 'id': 1, 'title': 'a'},
        ]),
      );

      expect(dataSource.fetchPosts, throwsA(isA<RemoteParsingException>()));
    });
  });

  group('createPost', () {
    test('POSTs the draft and parses the created post', () async {
      arrange(
        (_) => jsonResponse({
          'userId': 1,
          'id': 101,
          'title': 'novo',
          'body': 'corpo',
        }, statusCode: 201),
      );

      final dto = await dataSource.createPost(
        const PostDraft(title: 'novo', body: 'corpo'),
      );

      expect(dto.id, 101);
      final request = adapter.requests.single;
      expect(request.method, 'POST');
      expect(request.path, ApiEndpoints.posts);
      expect(request.data, {'userId': 1, 'title': 'novo', 'body': 'corpo'});
    });

    test('surfaces HTTP errors as DioException', () {
      arrange((_) => jsonResponse({'error': 'boom'}, statusCode: 400));

      expect(
        () => dataSource.createPost(const PostDraft(title: 't', body: 'b')),
        throwsA(isA<DioException>()),
      );
    });
  });
}
