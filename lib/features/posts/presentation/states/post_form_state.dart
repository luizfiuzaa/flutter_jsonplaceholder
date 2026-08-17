import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/post.dart';

part 'post_form_state.freezed.dart';

@freezed
class PostFormState with _$PostFormState {
  const PostFormState._();

  const factory PostFormState.editing() = PostFormEditing;

  const factory PostFormState.submitting() = PostFormSubmitting;

  const factory PostFormState.success(Post post) = PostFormSuccess;

  const factory PostFormState.failure(Failure failure) = PostFormFailure;

  bool get isSubmitting => this is PostFormSubmitting;

  Map<String, String> get fieldErrors => switch (this) {
    PostFormFailure(failure: ValidationFailure(:final fieldErrors)) =>
      fieldErrors,
    _ => const {},
  };
}
