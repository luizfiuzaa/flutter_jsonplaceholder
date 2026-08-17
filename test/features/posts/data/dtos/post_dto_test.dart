import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:json_placeholder_test/features/posts/data/dtos/post_dto.dart';
import 'package:json_placeholder_test/features/posts/domain/entities/post.dart';

void main() {
  const rawJson = '''
  {
    "userId": 3,
    "id": 42,
    "title": "sunt aut facere",
    "body": "quia et suscipit"
  }
  ''';

  group('PostDto', () {
    test('parses the JSONPlaceholder payload', () {
      final dto = PostDto.fromJson(jsonDecode(rawJson) as Map<String, dynamic>);

      expect(dto.id, 42);
      expect(dto.userId, 3);
      expect(dto.title, 'sunt aut facere');
      expect(dto.body, 'quia et suscipit');
    });

    test('survives a round trip through JSON', () {
      final dto = PostDto.fromJson(jsonDecode(rawJson) as Map<String, dynamic>);

      expect(PostDto.fromJson(dto.toJson()), dto);
    });

    test('converts to a remote Post with a namespaced local id', () {
      final dto = PostDto.fromJson(jsonDecode(rawJson) as Map<String, dynamic>);

      final post = dto.toRemotePost(createdAt: DateTime.utc(2026, 1, 1));

      expect(post.id, 'remote-42');
      expect(post.remoteId, 42);
      expect(post.origin, PostOrigin.remote);
      expect(post.title, 'sunt aut facere');
      expect(post.createdAt, DateTime.utc(2026, 1, 1));
    });
  });
}
