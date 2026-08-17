import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:json_placeholder_test/core/error/failure.dart';
import 'package:json_placeholder_test/features/posts/domain/entities/post.dart';
import 'package:json_placeholder_test/features/posts/domain/entities/post_draft.dart';
import 'package:json_placeholder_test/features/posts/domain/repositories/post_repository.dart';
import 'package:json_placeholder_test/features/posts/domain/usecases/create_post.dart';
import 'package:json_placeholder_test/features/posts/domain/validation/post_validators.dart';
import 'package:json_placeholder_test/features/posts/presentation/pages/post_form_page.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

class _MockPostRepository extends Mock implements PostRepository {}

void main() {
  late _MockPostRepository repository;

  final created = Post(
    id: 'local-1',
    userId: 1,
    title: 'Título válido',
    body: 'Descrição válida',
    origin: PostOrigin.local,
    createdAt: DateTime.utc(2026),
  );

  const titleKey = Key('post-form-title');
  const bodyKey = Key('post-form-body');
  const submitKey = Key('post-form-submit');

  setUpAll(() {
    registerFallbackValue(const PostDraft(title: 't', body: 'b'));
  });

  setUp(() => repository = _MockPostRepository());

  Future<Post?> pumpPage(WidgetTester tester) async {
    Post? popped;
    await tester.pumpWidget(
      Provider<CreatePost>.value(
        value: CreatePost(repository),
        child: MaterialApp(
          home: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () async {
                popped = await Navigator.of(context).push<Post>(
                  MaterialPageRoute(builder: (_) => const PostFormPage()),
                );
              },
              child: const Text('abrir'),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.text('abrir'));
    await tester.pumpAndSettle();
    return popped;
  }

  Future<void> fillValidForm(WidgetTester tester) async {
    await tester.enterText(find.byKey(titleKey), 'Título válido');
    await tester.enterText(find.byKey(bodyKey), 'Descrição válida');
  }

  testWidgets('blocks the submission and shows errors on empty fields', (
    tester,
  ) async {
    await pumpPage(tester);

    await tester.tap(find.byKey(submitKey));
    await tester.pumpAndSettle();

    expect(find.text(PostValidators.title('')!), findsOneWidget);
    expect(find.text(PostValidators.body('')!), findsOneWidget);
    verifyNever(() => repository.create(any()));
  });

  testWidgets('stops the title at the maximum length while typing', (
    tester,
  ) async {
    when(
      () => repository.create(any()),
    ).thenAnswer((_) async => Right<Failure, Post>(created));
    await pumpPage(tester);

    await tester.enterText(
      find.byKey(titleKey),
      'a' * (PostValidators.titleMaxLength + 10),
    );
    await tester.pump();

    final field = tester.widget<TextField>(
      find.descendant(
        of: find.byKey(titleKey),
        matching: find.byType(TextField),
      ),
    );
    expect(field.controller!.text.length, PostValidators.titleMaxLength);
  });

  testWidgets('shows an error when the title is too short', (tester) async {
    await pumpPage(tester);

    await tester.enterText(find.byKey(titleKey), 'ab');
    await tester.enterText(find.byKey(bodyKey), 'Descrição válida');
    await tester.tap(find.byKey(submitKey));
    await tester.pumpAndSettle();

    expect(find.text(PostValidators.title('ab')!), findsOneWidget);
    verifyNever(() => repository.create(any()));
  });

  testWidgets('sends the post and closes returning the created entity', (
    tester,
  ) async {
    when(
      () => repository.create(any()),
    ).thenAnswer((_) async => Right<Failure, Post>(created));

    await tester.pumpWidget(
      Provider<CreatePost>.value(
        value: CreatePost(repository),
        child: MaterialApp(
          home: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () => Navigator.of(context).push<Post>(
                MaterialPageRoute(builder: (_) => const PostFormPage()),
              ),
              child: const Text('abrir'),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.text('abrir'));
    await tester.pumpAndSettle();

    await fillValidForm(tester);
    await tester.tap(find.byKey(submitKey));
    await tester.pumpAndSettle();

    verify(
      () => repository.create(
        const PostDraft(title: 'Título válido', body: 'Descrição válida'),
      ),
    ).called(1);
    expect(find.byType(PostFormPage), findsNothing);
  });

  testWidgets('keeps the form open and shows the error when sending fails', (
    tester,
  ) async {
    when(() => repository.create(any())).thenAnswer(
      (_) async => const Left<Failure, Post>(Failure.noConnection()),
    );
    await pumpPage(tester);

    await fillValidForm(tester);
    await tester.tap(find.byKey(submitKey));
    await tester.pumpAndSettle();

    expect(find.byType(PostFormPage), findsOneWidget);
    expect(find.text(const Failure.noConnection().message), findsOneWidget);
  });

  testWidgets('disables the button while the request is in flight', (
    tester,
  ) async {
    when(() => repository.create(any())).thenAnswer((_) async {
      await Future<void>.delayed(const Duration(milliseconds: 50));
      return Right<Failure, Post>(created);
    });
    await pumpPage(tester);
    await fillValidForm(tester);

    await tester.tap(find.byKey(submitKey));
    await tester.pump();

    final button = tester.widget<FilledButton>(find.byKey(submitKey));
    expect(button.onPressed, isNull);

    await tester.pumpAndSettle();
  });
}
