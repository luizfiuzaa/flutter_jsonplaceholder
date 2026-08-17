import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:json_placeholder_test/core/error/failure.dart';
import 'package:json_placeholder_test/features/posts/domain/entities/post.dart';
import 'package:json_placeholder_test/features/posts/domain/entities/post_feed.dart';
import 'package:json_placeholder_test/features/posts/domain/repositories/post_repository.dart';
import 'package:json_placeholder_test/features/posts/domain/usecases/get_posts.dart';
import 'package:json_placeholder_test/features/posts/presentation/controllers/post_list_controller.dart';
import 'package:json_placeholder_test/features/posts/presentation/states/post_list_state.dart';
import 'package:mocktail/mocktail.dart';

class _MockPostRepository extends Mock implements PostRepository {}

void main() {
  late _MockPostRepository repository;
  late PostListController controller;

  Post post(String title) => Post(
    id: title,
    userId: 1,
    title: title,
    body: 'corpo',
    origin: PostOrigin.remote,
    createdAt: DateTime.utc(2026),
  );

  final posts = [post('Flutter'), post('Drift')];

  void arrangeFeed(PostFeed feed) {
    when(
      repository.getPosts,
    ).thenAnswer((_) async => Right<Failure, PostFeed>(feed));
  }

  setUp(() {
    repository = _MockPostRepository();
    controller = PostListController(getPosts: GetPosts(repository));
  });

  tearDown(() => controller.dispose());

  test('starts in the initial state with nothing to show', () {
    expect(controller.state, const PostListState.initial());
    expect(controller.visiblePosts, isEmpty);
  });

  test('goes through loading and ends loaded with the feed posts', () async {
    arrangeFeed(PostFeed(posts: posts, source: PostFeedSource.network));
    final seen = <PostListState>[];
    controller.addListener(() => seen.add(controller.state));

    await controller.load();

    expect(seen.first, const PostListState.loading());
    expect(controller.state, isA<PostListLoaded>());
    expect(controller.visiblePosts, posts);
  });

  test('exposes a stale feed as loaded, keeping the sync failure', () async {
    arrangeFeed(
      PostFeed(
        posts: posts,
        source: PostFeedSource.cache,
        syncFailure: const Failure.noConnection(),
      ),
    );

    await controller.load();

    final state = controller.state as PostListLoaded;
    expect(state.staleFailure, const Failure.noConnection());
    expect(controller.visiblePosts, posts);
  });

  test('goes to error when the feed cannot be loaded at all', () async {
    when(repository.getPosts).thenAnswer(
      (_) async => const Left<Failure, PostFeed>(Failure.noConnection()),
    );

    await controller.load();

    expect(controller.state, const PostListState.error(Failure.noConnection()));
    expect(controller.visiblePosts, isEmpty);
  });

  test('keeps the current list visible while refreshing', () async {
    arrangeFeed(PostFeed(posts: posts, source: PostFeedSource.network));
    await controller.load();

    final states = <PostListState>[];
    controller.addListener(() => states.add(controller.state));
    await controller.load();

    expect(
      states.first,
      isA<PostListLoaded>().having((s) => s.isRefreshing, 'isRefreshing', true),
    );
    expect(
      states.first,
      isA<PostListLoaded>().having((s) => s.posts, 'posts', posts),
    );
  });

  test('filters the visible posts by the search query', () async {
    arrangeFeed(PostFeed(posts: posts, source: PostFeedSource.network));
    await controller.load();

    controller.search('flu');

    expect(controller.visiblePosts.map((p) => p.title), ['Flutter']);
  });

  test('notifies listeners when the query changes', () async {
    arrangeFeed(PostFeed(posts: posts, source: PostFeedSource.network));
    await controller.load();
    var notifications = 0;
    controller.addListener(() => notifications++);

    controller.search('flu');

    expect(notifications, 1);
  });

  test('does not notify when the query is unchanged', () async {
    arrangeFeed(PostFeed(posts: posts, source: PostFeedSource.network));
    await controller.load();
    controller.search('flu');
    var notifications = 0;
    controller.addListener(() => notifications++);

    controller.search('flu');

    expect(notifications, 0);
  });

  test('keeps the query when the list is reloaded', () async {
    arrangeFeed(PostFeed(posts: posts, source: PostFeedSource.network));
    await controller.load();
    controller.search('flu');

    await controller.load();

    expect(controller.query, 'flu');
    expect(controller.visiblePosts.map((p) => p.title), ['Flutter']);
  });

  test(
    'shows a post created by the user at the top, without refetching',
    () async {
      arrangeFeed(PostFeed(posts: posts, source: PostFeedSource.network));
      await controller.load();
      final created = post('Meu post');

      controller.registerCreatedPost(created);

      expect(controller.visiblePosts.first, created);
      verify(repository.getPosts).called(1);
    },
  );

  test('ignores a created post when nothing is loaded yet', () {
    controller.registerCreatedPost(post('Meu post'));

    expect(controller.state, const PostListState.initial());
  });
}
