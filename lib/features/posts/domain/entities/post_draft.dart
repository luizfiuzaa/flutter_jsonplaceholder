import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_draft.freezed.dart';

@freezed
class PostDraft with _$PostDraft {
  const PostDraft._();

  const factory PostDraft({
    required String title,
    required String body,

    @Default(1) int userId,
  }) = _PostDraft;

  PostDraft trimmed() => copyWith(title: title.trim(), body: body.trim());
}
