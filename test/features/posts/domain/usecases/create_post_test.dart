import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:json_placeholder_test/core/error/failure.dart';
import 'package:json_placeholder_test/features/posts/domain/entities/post.dart';
import 'package:json_placeholder_test/features/posts/domain/entities/post_draft.dart';
import 'package:json_placeholder_test/features/posts/domain/repositories/post_repository.dart';
import 'package:json_placeholder_test/features/posts/domain/usecases/create_post.dart';
import 'package:mocktail/mocktail.dart';

class _MockPostRepository extends Mock implements PostRepository {}

void main() {
  late _MockPostRepository repository;
  late CreatePost createPost;

  final created = Post(
    id: 'local-1',
    userId: 1,
    title: 'Título',
    body: 'Descrição',
    origin: PostOrigin.local,
    createdAt: DateTime.utc(2026),
  );

  setUpAll(() {
    registerFallbackValue(const PostDraft(title: 't', body: 'b'));
  });

  setUp(() {
    repository = _MockPostRepository();
    createPost = CreatePost(repository);
  });

  test('delegates a valid draft to the repository', () async {
    when(
      () => repository.create(any()),
    ).thenAnswer((_) async => Right<Failure, Post>(created));

    final result = await createPost(
      const PostDraft(title: 'Título', body: 'Descrição'),
    );

    expect(result.getRight().toNullable(), created);
    verify(
      () => repository.create(
        const PostDraft(title: 'Título', body: 'Descrição'),
      ),
    ).called(1);
  });

  test('trims the draft before handing it to the repository', () async {
    when(
      () => repository.create(any()),
    ).thenAnswer((_) async => Right<Failure, Post>(created));

    await createPost(
      const PostDraft(title: '  Título  ', body: '  Descrição  '),
    );

    verify(
      () => repository.create(
        const PostDraft(title: 'Título', body: 'Descrição'),
      ),
    ).called(1);
  });

  test('rejects an invalid draft without touching the repository', () async {
    final result = await createPost(const PostDraft(title: '', body: ''));

    final failure = result.getLeft().toNullable();
    expect(failure, isA<ValidationFailure>());
    expect(
      (failure! as ValidationFailure).fieldErrors.keys,
      containsAll(<String>['title', 'body']),
    );
    verifyNever(() => repository.create(any()));
  });

  test('propagates a repository failure untouched', () async {
    when(
      () => repository.create(any()),
    ).thenAnswer((_) async => const Left<Failure, Post>(Failure.timeout()));

    final result = await createPost(
      const PostDraft(title: 'Título', body: 'Descrição'),
    );

    expect(result.getLeft().toNullable(), const Failure.timeout());
  });
}
