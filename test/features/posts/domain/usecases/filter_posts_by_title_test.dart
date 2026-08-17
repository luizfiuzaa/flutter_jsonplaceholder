import 'package:flutter_test/flutter_test.dart';
import 'package:json_placeholder_test/features/posts/domain/entities/post.dart';
import 'package:json_placeholder_test/features/posts/domain/usecases/filter_posts_by_title.dart';

void main() {
  Post post(String title) => Post(
    id: title,
    userId: 1,
    title: title,
    body: 'irrelevante',
    origin: PostOrigin.remote,
    createdAt: DateTime.utc(2026),
  );

  final posts = [
    post('Flutter e Dart'),
    post('Arquitetura limpa'),
    post('Persistência local'),
  ];

  const filter = FilterPostsByTitle();

  test('returns every post when the query is empty or blank', () {
    expect(filter(posts, ''), posts);
    expect(filter(posts, '   '), posts);
  });

  test('matches titles case-insensitively', () {
    expect(filter(posts, 'FLUTTER').single.title, 'Flutter e Dart');
  });

  test('matches partial words anywhere in the title', () {
    expect(filter(posts, 'quitet').single.title, 'Arquitetura limpa');
  });

  test('ignores diacritics on both sides of the comparison', () {
    expect(filter(posts, 'persistencia').single.title, 'Persistência local');
    expect(filter([post('Persistencia local')], 'persistência').length, 1);
  });

  test('ignores surrounding whitespace in the query', () {
    expect(filter(posts, '  limpa  ').single.title, 'Arquitetura limpa');
  });

  test('returns an empty list when nothing matches', () {
    expect(filter(posts, 'kotlin'), isEmpty);
  });

  test('never searches the body', () {
    expect(filter(posts, 'irrelevante'), isEmpty);
  });
}
