import 'package:flutter/foundation.dart';

import '../../domain/entities/post.dart';
import '../../domain/usecases/filter_posts_by_title.dart';
import '../../domain/usecases/get_posts.dart';
import '../states/post_list_state.dart';

class PostListController extends ChangeNotifier {
  PostListController({
    required this.getPosts,
    this.filterPostsByTitle = const FilterPostsByTitle(),
  });

  final GetPosts getPosts;
  final FilterPostsByTitle filterPostsByTitle;

  PostListState _state = const PostListState.initial();
  PostListState get state => _state;

  String _query = '';
  String get query => _query;

  List<Post> get visiblePosts => filterPostsByTitle(_state.posts, _query);

  bool get hasQueryWithoutResults =>
      _query.trim().isNotEmpty &&
      _state.posts.isNotEmpty &&
      visiblePosts.isEmpty;

  Future<void> load() async {
    _emit(switch (_state) {
      PostListLoaded(:final posts, :final staleFailure) => PostListState.loaded(
        posts: posts,
        isRefreshing: true,
        staleFailure: staleFailure,
      ),
      _ => const PostListState.loading(),
    });

    final result = await getPosts();

    _emit(
      result.match(
        PostListState.error,
        (feed) => PostListState.loaded(
          posts: feed.posts,
          staleFailure: feed.syncFailure,
        ),
      ),
    );
  }

  void search(String query) {
    if (query == _query) return;
    _query = query;
    notifyListeners();
  }

  void registerCreatedPost(Post post) {
    final current = _state;
    if (current is! PostListLoaded) return;

    _emit(current.copyWith(posts: [post, ...current.posts]));
  }

  void _emit(PostListState next) {
    _state = next;
    notifyListeners();
  }
}
