import 'package:flutter_test/flutter_test.dart';
import 'package:json_placeholder_test/features/posts/domain/validation/post_validators.dart';

void main() {
  group('PostValidators.title', () {
    test('rejects empty and whitespace-only titles', () {
      expect(PostValidators.title(''), isNotNull);
      expect(PostValidators.title('   '), isNotNull);
      expect(PostValidators.title(null), isNotNull);
    });

    test('rejects titles shorter than the minimum length', () {
      expect(PostValidators.title('ab'), isNotNull);
    });

    test('rejects titles longer than the maximum length', () {
      final tooLong = 'a' * (PostValidators.titleMaxLength + 1);

      expect(PostValidators.title(tooLong), isNotNull);
    });

    test('accepts a title within bounds, ignoring surrounding whitespace', () {
      expect(PostValidators.title('  Um título válido  '), isNull);
      expect(PostValidators.title('a' * PostValidators.titleMaxLength), isNull);
    });
  });

  group('PostValidators.body', () {
    test('rejects empty bodies', () {
      expect(PostValidators.body(''), isNotNull);
      expect(PostValidators.body(null), isNotNull);
    });

    test('rejects bodies longer than the maximum length', () {
      expect(
        PostValidators.body('a' * (PostValidators.bodyMaxLength + 1)),
        isNotNull,
      );
    });

    test('accepts a body within bounds', () {
      expect(PostValidators.body('Uma descrição suficiente.'), isNull);
      expect(PostValidators.body('a' * PostValidators.bodyMaxLength), isNull);
    });
  });
}
