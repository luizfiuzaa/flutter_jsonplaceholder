import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:json_placeholder_test/core/error/failure.dart';
import 'package:json_placeholder_test/features/posts/domain/entities/post.dart';
import 'package:json_placeholder_test/features/posts/domain/entities/post_draft.dart';
import 'package:json_placeholder_test/features/posts/domain/entities/post_feed.dart';
import 'package:json_placeholder_test/features/posts/domain/repositories/post_repository.dart';
import 'package:json_placeholder_test/features/posts/domain/usecases/create_post.dart';
import 'package:json_placeholder_test/features/posts/domain/usecases/get_posts.dart';
import 'package:json_placeholder_test/features/posts/presentation/controllers/post_list_controller.dart';
import 'package:json_placeholder_test/features/posts/presentation/pages/post_detail_page.dart';
import 'package:json_placeholder_test/features/posts/presentation/pages/post_form_page.dart';
import 'package:json_placeholder_test/features/posts/presentation/pages/post_list_page.dart';
import 'package:json_placeholder_test/features/posts/presentation/widgets/post_card.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

class _MockPostRepository extends Mock implements PostRepository {}

void main() {
  late _MockPostRepository repository;

  Post post(String title) => Post(
    id: title,
    userId: 1,
    title: title,
    body: 'corpo de $title',
    origin: PostOrigin.remote,
    createdAt: DateTime.utc(2026),
  );

  final posts = [post('Flutter'), post('Drift')];

  setUpAll(() {
    registerFallbackValue(const PostDraft(title: 't', body: 'b'));
  });

  setUp(() => repository = _MockPostRepository());

  Future<void> pumpPage(WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          Provider<CreatePost>.value(value: CreatePost(repository)),
          ChangeNotifierProvider<PostListController>(
            create: (_) => PostListController(getPosts: GetPosts(repository)),
          ),
        ],
        child: const MaterialApp(home: PostListPage()),
      ),
    );
  }

  void arrangeFeed(PostFeed feed) {
    when(
      repository.getPosts,
    ).thenAnswer((_) async => Right<Failure, PostFeed>(feed));
  }

  testWidgets('shows a spinner before the first list arrives', (tester) async {
    arrangeFeed(PostFeed(posts: posts, source: PostFeedSource.network));

    await pumpPage(tester);

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.byType(PostCard), findsNothing);

    await tester.pumpAndSettle();
  });

  testWidgets('lists the posts returned by the repository', (tester) async {
    arrangeFeed(PostFeed(posts: posts, source: PostFeedSource.network));

    await pumpPage(tester);
    await tester.pumpAndSettle();

    expect(find.byType(PostCard), findsNWidgets(2));
    expect(find.text('Flutter'), findsOneWidget);
    expect(find.text('corpo de Drift'), findsOneWidget);
  });

  testWidgets('filters the list as the user types in the search field', (
    tester,
  ) async {
    arrangeFeed(PostFeed(posts: posts, source: PostFeedSource.network));
    await pumpPage(tester);
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), 'flu');
    await tester.pumpAndSettle();

    expect(find.text('Flutter'), findsOneWidget);
    expect(find.text('Drift'), findsNothing);
  });

  testWidgets('tells the user when the search matches nothing', (tester) async {
    arrangeFeed(PostFeed(posts: posts, source: PostFeedSource.network));
    await pumpPage(tester);
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), 'kotlin');
    await tester.pumpAndSettle();

    expect(find.textContaining('Nenhum post encontrado'), findsOneWidget);
    expect(find.byType(PostCard), findsNothing);
  });

  testWidgets('shows an empty state when there is no post at all', (
    tester,
  ) async {
    arrangeFeed(const PostFeed(posts: [], source: PostFeedSource.network));

    await pumpPage(tester);
    await tester.pumpAndSettle();

    expect(find.textContaining('Nenhum post por aqui'), findsOneWidget);
  });

  testWidgets('shows the failure message and retries on demand', (
    tester,
  ) async {
    when(repository.getPosts).thenAnswer(
      (_) async => const Left<Failure, PostFeed>(Failure.noConnection()),
    );
    await pumpPage(tester);
    await tester.pumpAndSettle();

    expect(find.text(const Failure.noConnection().message), findsOneWidget);

    arrangeFeed(PostFeed(posts: posts, source: PostFeedSource.network));
    await tester.tap(find.text('Tentar novamente'));
    await tester.pumpAndSettle();

    expect(find.byType(PostCard), findsNWidgets(2));
  });

  testWidgets('warns that the list came from the cache', (tester) async {
    arrangeFeed(
      PostFeed(
        posts: posts,
        source: PostFeedSource.cache,
        syncFailure: const Failure.noConnection(),
      ),
    );

    await pumpPage(tester);
    await tester.pumpAndSettle();

    expect(find.textContaining('dados salvos'), findsOneWidget);
    expect(find.byType(PostCard), findsNWidgets(2));
  });

  testWidgets('opens the detail page when a post is tapped', (tester) async {
    arrangeFeed(PostFeed(posts: posts, source: PostFeedSource.network));
    await pumpPage(tester);
    await tester.pumpAndSettle();

    await tester.tap(find.text('Flutter'));
    await tester.pumpAndSettle();

    expect(find.byType(PostDetailPage), findsOneWidget);
    expect(
      find.descendant(
        of: find.byType(PostDetailPage),
        matching: find.text('corpo de Flutter'),
      ),
      findsOneWidget,
    );
  });

  testWidgets('opens the form and shows the created post on top', (
    tester,
  ) async {
    arrangeFeed(PostFeed(posts: posts, source: PostFeedSource.network));
    when(() => repository.create(any())).thenAnswer(
      (_) async => Right<Failure, Post>(
        Post(
          id: 'local-1',
          userId: 1,
          title: 'Post novo',
          body: 'Descrição nova',
          origin: PostOrigin.local,
          createdAt: DateTime.utc(2026, 2),
        ),
      ),
    );
    await pumpPage(tester);
    await tester.pumpAndSettle();

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();
    expect(find.byType(PostFormPage), findsOneWidget);

    await tester.enterText(
      find.byKey(const Key('post-form-title')),
      'Post novo',
    );
    await tester.enterText(
      find.byKey(const Key('post-form-body')),
      'Descrição nova',
    );
    await tester.tap(find.byKey(const Key('post-form-submit')));
    await tester.pumpAndSettle();

    expect(find.byType(PostListPage), findsOneWidget);
    expect(
      tester.widget<PostCard>(find.byType(PostCard).first).post.title,
      'Post novo',
    );
    verify(repository.getPosts).called(1);
  });
}
