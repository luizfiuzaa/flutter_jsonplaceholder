import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:json_placeholder_test/core/error/failure.dart';
import 'package:json_placeholder_test/features/posts/domain/entities/post_feed.dart';
import 'package:json_placeholder_test/features/posts/domain/repositories/post_repository.dart';
import 'package:json_placeholder_test/features/posts/domain/usecases/get_posts.dart';
import 'package:mocktail/mocktail.dart';

class _MockPostRepository extends Mock implements PostRepository {}

void main() {
  late _MockPostRepository repository;
  late GetPosts getPosts;

  const feed = PostFeed(posts: [], source: PostFeedSource.network);

  setUp(() {
    repository = _MockPostRepository();
    getPosts = GetPosts(repository);
  });

  test('asks the repository for the feed and returns it', () async {
    when(
      repository.getPosts,
    ).thenAnswer((_) async => const Right<Failure, PostFeed>(feed));

    final result = await getPosts();

    expect(result.getRight().toNullable(), feed);
    verify(repository.getPosts).called(1);
  });

  test('propagates failures', () async {
    when(repository.getPosts).thenAnswer(
      (_) async => const Left<Failure, PostFeed>(Failure.noConnection()),
    );

    final result = await getPosts();

    expect(result.getLeft().toNullable(), const Failure.noConnection());
  });
}
