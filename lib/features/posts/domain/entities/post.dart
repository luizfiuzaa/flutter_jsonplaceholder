import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.freezed.dart';

enum PostOrigin { remote, local }

@freezed
class Post with _$Post {
  const Post._();

  const factory Post({
    required String id,
    required int userId,
    required String title,
    required String body,
    required PostOrigin origin,
    required DateTime createdAt,
    int? remoteId,
  }) = _Post;

  bool get isLocal => origin == PostOrigin.local;

  static String remoteIdToLocalKey(int remoteId) => 'remote-$remoteId';
}
