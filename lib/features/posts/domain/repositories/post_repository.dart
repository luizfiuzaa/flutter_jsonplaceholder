import '../../../../core/typedefs.dart';
import '../entities/post.dart';
import '../entities/post_draft.dart';
import '../entities/post_feed.dart';

abstract interface class PostRepository {
  Future<Result<PostFeed>> getPosts();
  Future<Result<Post>> create(PostDraft draft);
  Future<Result<Post>> getById(String id);
}
