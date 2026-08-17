import 'package:flutter/material.dart';

import '../../domain/entities/post.dart';

class PostDetailPage extends StatelessWidget {
  const PostDetailPage({required this.post, super.key});

  final Post post;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Detalhe do post')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post.title, style: theme.textTheme.headlineSmall),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              children: [
                Chip(
                  avatar: const Icon(Icons.person_outline, size: 16),
                  label: Text('Autor #${post.userId}'),
                ),
                Chip(
                  avatar: Icon(
                    post.isLocal ? Icons.phone_android : Icons.cloud_outlined,
                    size: 16,
                  ),
                  label: Text(post.isLocal ? 'Criado no app' : 'Vindo da API'),
                ),
                if (post.remoteId != null)
                  Chip(
                    avatar: const Icon(Icons.tag, size: 16),
                    label: Text('id ${post.remoteId}'),
                  ),
              ],
            ),
            const Divider(height: 32),
            Text(post.body, style: theme.textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}
