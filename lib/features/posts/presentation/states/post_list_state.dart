import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/post.dart';

part 'post_list_state.freezed.dart';

@freezed
class PostListState with _$PostListState {
  const PostListState._();

  const factory PostListState.initial() = PostListInitial;

  const factory PostListState.loading() = PostListLoading;

  const factory PostListState.loaded({
    required List<Post> posts,
    @Default(false) bool isRefreshing,
    Failure? staleFailure,
  }) = PostListLoaded;

  const factory PostListState.error(Failure failure) = PostListError;

  List<Post> get posts => switch (this) {
    PostListLoaded(:final posts) => posts,
    _ => const [],
  };
}
