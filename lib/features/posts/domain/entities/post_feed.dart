import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/error/failure.dart';
import 'post.dart';

part 'post_feed.freezed.dart';

enum PostFeedSource { network, cache }

@freezed
class PostFeed with _$PostFeed {
  const PostFeed._();

  const factory PostFeed({
    required List<Post> posts,
    required PostFeedSource source,
    Failure? syncFailure,
  }) = _PostFeed;

  bool get isStale => source == PostFeedSource.cache && syncFailure != null;
}
