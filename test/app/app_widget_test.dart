import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:json_placeholder_test/app/app_widget.dart';
import 'package:json_placeholder_test/core/database/app_database.dart';
import 'package:json_placeholder_test/features/posts/presentation/pages/post_list_page.dart';
import 'package:json_placeholder_test/features/posts/presentation/widgets/post_card.dart';

class _StubAdapter implements HttpClientAdapter {
  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    return ResponseBody.fromString(
      jsonEncode([
        {'userId': 1, 'id': 1, 'title': 'Post da API', 'body': 'corpo'},
      ]),
      200,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

void main() {
  testWidgets('wires the whole app end to end, from HTTP to the list', (
    tester,
  ) async {
    final database = AppDatabase.inMemory();
    addTearDown(database.close);
    final dio = Dio(BaseOptions(baseUrl: 'https://example.test'))
      ..httpClientAdapter = _StubAdapter();

    await tester.pumpWidget(AppWidget(database: database, dio: dio));
    await tester.pumpAndSettle();

    expect(find.byType(PostListPage), findsOneWidget);
    expect(find.byType(PostCard), findsOneWidget);
    expect(find.text('Post da API'), findsOneWidget);
  });

  testWidgets('persists a fetched list into the database', (tester) async {
    final database = AppDatabase.inMemory();
    addTearDown(database.close);
    final dio = Dio(BaseOptions(baseUrl: 'https://example.test'))
      ..httpClientAdapter = _StubAdapter();

    await tester.pumpWidget(AppWidget(database: database, dio: dio));
    await tester.pumpAndSettle();

    final rows = await database.select(database.postRows).get();
    expect(rows.single.title, 'Post da API');
  });
}
