import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/entities/post.dart';
import '../../domain/usecases/create_post.dart';
import '../../domain/validation/post_validators.dart';
import '../controllers/post_form_controller.dart';
import '../states/post_form_state.dart';

class PostFormPage extends StatelessWidget {
  const PostFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          PostFormController(createPost: context.read<CreatePost>()),
      child: const _PostFormView(),
    );
  }
}

class _PostFormView extends StatefulWidget {
  const _PostFormView();

  @override
  State<_PostFormView> createState() => _PostFormViewState();
}

class _PostFormViewState extends State<_PostFormView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _title = TextEditingController();
  final TextEditingController _body = TextEditingController();

  @override
  void dispose() {
    _title.dispose();
    _body.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    final controller = context.read<PostFormController>();
    await controller.submit(title: _title.text, body: _body.text);

    if (!mounted) return;

    final state = controller.state;
    if (state is PostFormSuccess) {
      Navigator.of(context).pop<Post>(state.post);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<PostFormController>().state;

    return Scaffold(
      appBar: AppBar(title: const Text('Novo post')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            TextFormField(
              key: const Key('post-form-title'),
              controller: _title,
              enabled: !state.isSubmitting,
              maxLength: PostValidators.titleMaxLength,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: 'Título',
                border: OutlineInputBorder(),
              ),
              validator: PostValidators.title,
            ),
            const SizedBox(height: 16),
            TextFormField(
              key: const Key('post-form-body'),
              controller: _body,
              enabled: !state.isSubmitting,
              maxLength: PostValidators.bodyMaxLength,
              maxLines: 6,
              minLines: 4,
              decoration: const InputDecoration(
                labelText: 'Descrição',
                alignLabelWithHint: true,
                border: OutlineInputBorder(),
              ),
              validator: PostValidators.body,
            ),
            if (state case PostFormFailure(:final failure)) ...[
              const SizedBox(height: 8),
              _ErrorMessage(message: failure.message),
            ],
            const SizedBox(height: 24),
            FilledButton(
              key: const Key('post-form-submit'),
              onPressed: state.isSubmitting ? null : _submit,
              child: state.isSubmitting
                  ? const SizedBox.square(
                      dimension: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Publicar'),
            ),
          ],
        ),
      ),
    );
  }
}

class _ErrorMessage extends StatelessWidget {
  const _ErrorMessage({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.errorContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(
            Icons.error_outline,
            size: 20,
            color: theme.colorScheme.onErrorContainer,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onErrorContainer,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
