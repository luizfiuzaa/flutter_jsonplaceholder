import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/post.dart';

part 'post_dto.freezed.dart';
part 'post_dto.g.dart';

@freezed
class PostDto with _$PostDto {
  const PostDto._();

  const factory PostDto({
    required int userId,
    required int id,
    required String title,
    required String body,
  }) = _PostDto;

  factory PostDto.fromJson(Map<String, dynamic> json) =>
      _$PostDtoFromJson(json);

  static Map<String, Object?> createBody({
    required int userId,
    required String title,
    required String body,
  }) => {'userId': userId, 'title': title, 'body': body};

  Post toRemotePost({required DateTime createdAt}) => Post(
    id: Post.remoteIdToLocalKey(id),
    userId: userId,
    title: title,
    body: body,
    origin: PostOrigin.remote,
    createdAt: createdAt,
    remoteId: id,
  );
}
