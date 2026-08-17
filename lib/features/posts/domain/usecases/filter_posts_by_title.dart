import '../../../../core/utils/text_normalizer.dart';
import '../entities/post.dart';

class FilterPostsByTitle {
  const FilterPostsByTitle();

  List<Post> call(List<Post> posts, String query) {
    final normalizedQuery = TextNormalizer.normalize(query);
    if (normalizedQuery.isEmpty) return posts;

    return posts
        .where(
          (post) =>
              TextNormalizer.normalize(post.title).contains(normalizedQuery),
        )
        .toList(growable: false);
  }
}
