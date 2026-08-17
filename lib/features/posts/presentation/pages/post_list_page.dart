import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/entities/post.dart';
import '../controllers/post_list_controller.dart';
import '../states/post_list_state.dart';
import '../widgets/message_view.dart';
import '../widgets/post_card.dart';
import '../widgets/post_search_field.dart';
import 'post_detail_page.dart';
import 'post_form_page.dart';

class PostListPage extends StatefulWidget {
  const PostListPage({super.key});

  @override
  State<PostListPage> createState() => _PostListPageState();
}

class _PostListPageState extends State<PostListPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) context.read<PostListController>().load();
    });
  }

  Future<void> _openForm() async {
    final controller = context.read<PostListController>();

    final created = await Navigator.of(
      context,
    ).push<Post>(MaterialPageRoute(builder: (_) => const PostFormPage()));

    if (created != null) controller.registerCreatedPost(created);
  }

  void _openDetail(Post post) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => PostDetailPage(post: post)));
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<PostListController>();

    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _openForm,
        icon: const Icon(Icons.add),
        label: const Text('Novo post'),
      ),
      body: Column(
        children: [
          PostSearchField(onChanged: controller.search),
          if (controller.state case PostListLoaded(:final staleFailure?))
            _StaleBanner(message: staleFailure.message),
          Expanded(
            child: _Body(controller: controller, onTap: _openDetail),
          ),
        ],
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.controller, required this.onTap});

  final PostListController controller;
  final ValueChanged<Post> onTap;

  @override
  Widget build(BuildContext context) {
    return switch (controller.state) {
      PostListError(:final failure) => MessageView(
        icon: Icons.cloud_off,
        title: 'Não foi possível carregar os posts',
        description: failure.message,
        onRetry: controller.load,
      ),
      PostListLoaded(:final posts) when posts.isEmpty => const MessageView(
        icon: Icons.article_outlined,
        title: 'Nenhum post por aqui',
        description: 'Toque em "Novo post" para criar o primeiro.',
      ),
      PostListLoaded() when controller.hasQueryWithoutResults =>
        const MessageView(
          icon: Icons.search_off,
          title: 'Nenhum post encontrado',
          description: 'Tente outro termo de busca.',
        ),
      PostListLoaded() => _PostList(controller: controller, onTap: onTap),
      _ => const Center(child: CircularProgressIndicator()),
    };
  }
}

class _PostList extends StatelessWidget {
  const _PostList({required this.controller, required this.onTap});

  final PostListController controller;
  final ValueChanged<Post> onTap;

  @override
  Widget build(BuildContext context) {
    final posts = controller.visiblePosts;

    return RefreshIndicator(
      onRefresh: controller.load,
      child: ListView.builder(
        padding: const EdgeInsets.only(bottom: 96),
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return PostCard(post: post, onTap: () => onTap(post));
        },
      ),
    );
  }
}

class _StaleBanner extends StatelessWidget {
  const _StaleBanner({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      color: theme.colorScheme.tertiaryContainer,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          Icon(
            Icons.cloud_off,
            size: 18,
            color: theme.colorScheme.onTertiaryContainer,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'Exibindo dados salvos no dispositivo. $message',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onTertiaryContainer,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
