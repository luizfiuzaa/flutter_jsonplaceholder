abstract final class PostValidators {
  static const int titleMinLength = 3;
  static const int titleMaxLength = 100;
  static const int bodyMinLength = 1;
  static const int bodyMaxLength = 500;

  static const String titleField = 'title';
  static const String bodyField = 'body';

  static String? title(String? value) {
    final title = value?.trim() ?? '';
    if (title.isEmpty) return 'Informe um título.';
    if (title.length < titleMinLength) {
      return 'O título precisa de ao menos $titleMinLength caracteres.';
    }
    if (title.length > titleMaxLength) {
      return 'O título deve ter no máximo $titleMaxLength caracteres.';
    }
    return null;
  }

  static String? body(String? value) {
    final body = value?.trim() ?? '';
    if (body.length < bodyMinLength) return 'Informe uma descrição.';
    if (body.length > bodyMaxLength) {
      return 'A descrição deve ter no máximo $bodyMaxLength caracteres.';
    }
    return null;
  }

  static Map<String, String> validateDraft({
    required String title,
    required String body,
  }) {
    final errors = <String, String>{};
    final titleError = PostValidators.title(title);
    if (titleError != null) errors[titleField] = titleError;
    final bodyError = PostValidators.body(body);
    if (bodyError != null) errors[bodyField] = bodyError;
    return errors;
  }
}
