import 'package:flutter/foundation.dart';

import '../../domain/entities/post_draft.dart';
import '../../domain/usecases/create_post.dart';
import '../states/post_form_state.dart';

class PostFormController extends ChangeNotifier {
  PostFormController({required this.createPost});

  final CreatePost createPost;

  PostFormState _state = const PostFormState.editing();
  PostFormState get state => _state;

  Future<void> submit({required String title, required String body}) async {
    if (_state.isSubmitting) return;

    _emit(const PostFormState.submitting());

    final result = await createPost(PostDraft(title: title, body: body));

    _emit(result.match(PostFormState.failure, PostFormState.success));
  }

  void _emit(PostFormState next) {
    _state = next;
    notifyListeners();
  }
}
