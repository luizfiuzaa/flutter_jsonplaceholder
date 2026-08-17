import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:json_placeholder_test/core/error/failure.dart';
import 'package:json_placeholder_test/features/posts/domain/entities/post.dart';
import 'package:json_placeholder_test/features/posts/domain/entities/post_draft.dart';
import 'package:json_placeholder_test/features/posts/domain/repositories/post_repository.dart';
import 'package:json_placeholder_test/features/posts/domain/usecases/create_post.dart';
import 'package:json_placeholder_test/features/posts/presentation/controllers/post_form_controller.dart';
import 'package:json_placeholder_test/features/posts/presentation/states/post_form_state.dart';
import 'package:mocktail/mocktail.dart';

class _MockPostRepository extends Mock implements PostRepository {}

void main() {
  late _MockPostRepository repository;
  late PostFormController controller;

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
    controller = PostFormController(createPost: CreatePost(repository));
  });

  tearDown(() => controller.dispose());

  test('starts editing', () {
    expect(controller.state, const PostFormState.editing());
  });

  test('submits the typed draft and ends in success', () async {
    when(
      () => repository.create(any()),
    ).thenAnswer((_) async => Right<Failure, Post>(created));
    final seen = <PostFormState>[];
    controller.addListener(() => seen.add(controller.state));

    await controller.submit(title: 'Título', body: 'Descrição');

    expect(seen.first, const PostFormState.submitting());
    expect(controller.state, PostFormState.success(created));
    verify(
      () => repository.create(
        const PostDraft(title: 'Título', body: 'Descrição'),
      ),
    ).called(1);
  });

  test('exposes the failure when the submission fails', () async {
    when(
      () => repository.create(any()),
    ).thenAnswer((_) async => const Left<Failure, Post>(Failure.timeout()));

    await controller.submit(title: 'Título', body: 'Descrição');

    expect(controller.state, const PostFormState.failure(Failure.timeout()));
  });

  test(
    'reports validation errors per field and never calls the repository',
    () async {
      await controller.submit(title: '', body: '');

      final state = controller.state;
      expect(state, isA<PostFormFailure>());
      expect((state as PostFormFailure).failure, isA<ValidationFailure>());
      verifyNever(() => repository.create(any()));
    },
  );

  test('can retry after a failure', () async {
    when(
      () => repository.create(any()),
    ).thenAnswer((_) async => const Left<Failure, Post>(Failure.timeout()));
    await controller.submit(title: 'Título', body: 'Descrição');

    when(
      () => repository.create(any()),
    ).thenAnswer((_) async => Right<Failure, Post>(created));
    await controller.submit(title: 'Título', body: 'Descrição');

    expect(controller.state, PostFormState.success(created));
  });

  test('ignores a second submission while one is in flight', () async {
    when(() => repository.create(any())).thenAnswer((_) async {
      await Future<void>.delayed(const Duration(milliseconds: 20));
      return Right<Failure, Post>(created);
    });

    final first = controller.submit(title: 'Título', body: 'Descrição');
    final second = controller.submit(title: 'Título', body: 'Descrição');
    await Future.wait([first, second]);

    verify(() => repository.create(any())).called(1);
  });
}
