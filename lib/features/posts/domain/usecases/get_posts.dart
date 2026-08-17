import '../../../../core/typedefs.dart';
import '../entities/post_feed.dart';
import '../repositories/post_repository.dart';

class GetPosts {
  const GetPosts(this._repository);

  final PostRepository _repository;

  Future<Result<PostFeed>> call() => _repository.getPosts();
}
