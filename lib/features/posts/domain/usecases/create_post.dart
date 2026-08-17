import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/typedefs.dart';
import '../entities/post.dart';
import '../entities/post_draft.dart';
import '../repositories/post_repository.dart';
import '../validation/post_validators.dart';

class CreatePost {
  const CreatePost(this._repository);

  final PostRepository _repository;

  Future<Result<Post>> call(PostDraft draft) async {
    final normalized = draft.trimmed();
    final errors = PostValidators.validateDraft(
      title: normalized.title,
      body: normalized.body,
    );

    if (errors.isNotEmpty) {
      return Left(Failure.validation(errors));
    }

    return _repository.create(normalized);
  }
}
