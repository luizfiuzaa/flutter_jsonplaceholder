import 'package:flutter/material.dart';

/// Campo de busca da listagem.
///
/// Filtra a cada tecla, sem debounce: a busca é local, sobre uma lista já em
/// memória. Quando ela passar a bater no servidor, o debounce entra aqui.
///
/// O botão de limpar depende apenas de o campo estar vazio ou não — estado que
/// o próprio [TextEditingController] já guarda e notifica, por ser um
/// `ValueNotifier<TextEditingValue>` (portanto um [ChangeNotifier]). A
/// reconstrução vem de um [ValueListenableBuilder] escutando esse notifier, e
/// não de `setState`: não existe cópia do texto mantida em paralelo para sair
/// de sincronia, e a assinatura da UI segue a mesma do resto do app —
/// widget escuta notifier.
class PostSearchField extends StatefulWidget {
  const PostSearchField({required this.onChanged, super.key});

  final ValueChanged<String> onChanged;

  @override
  State<PostSearchField> createState() => _PostSearchFieldState();
}

class _PostSearchFieldState extends State<PostSearchField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _clear() {
    _controller.clear();
    widget.onChanged('');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
      child: ValueListenableBuilder<TextEditingValue>(
        valueListenable: _controller,
        builder: (context, value, _) => TextField(
          controller: _controller,
          textInputAction: TextInputAction.search,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            hintText: 'Buscar pelo título',
            prefixIcon: const Icon(Icons.search),
            suffixIcon: value.text.isEmpty
                ? null
                : IconButton(
                    icon: const Icon(Icons.close),
                    tooltip: 'Limpar busca',
                    onPressed: _clear,
                  ),
            border: const OutlineInputBorder(),
            isDense: true,
          ),
        ),
      ),
    );
  }
}
