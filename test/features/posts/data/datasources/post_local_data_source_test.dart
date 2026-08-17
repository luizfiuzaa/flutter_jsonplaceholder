import 'package:drift/drift.dart' show DatabaseConnection;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:json_placeholder_test/core/database/app_database.dart';
import 'package:json_placeholder_test/features/posts/data/datasources/post_local_data_source.dart';
import 'package:json_placeholder_test/features/posts/domain/entities/post.dart';

void main() {
  late AppDatabase database;
  late PostLocalDataSource dataSource;

  Post remote(int id, {String title = 'remoto'}) => Post(
    id: Post.remoteIdToLocalKey(id),
    userId: 1,
    title: title,
    body: 'corpo $id',
    origin: PostOrigin.remote,
    createdAt: DateTime.utc(2026, 1, id),
    remoteId: id,
  );

  Post local(String id, {required DateTime createdAt}) => Post(
    id: id,
    userId: 1,
    title: 'meu post $id',
    body: 'corpo',
    origin: PostOrigin.local,
    createdAt: createdAt,
  );

  setUp(() {
    database = AppDatabase(DatabaseConnection(NativeDatabase.memory()));
    dataSource = DriftPostLocalDataSource(database);
  });

  tearDown(() => database.close());

  test('starts empty', () async {
    expect(await dataSource.readAll(), isEmpty);
  });

  test('persists posts created by the user', () async {
    final post = local('local-1', createdAt: DateTime.utc(2026, 2, 1));

    await dataSource.saveLocalPost(post);

    expect(await dataSource.readAll(), [post]);
  });

  test('caches the remote list', () async {
    await dataSource.replaceRemoteCache([remote(1), remote(2)]);

    final stored = await dataSource.readAll();
    expect(stored.map((p) => p.remoteId), [1, 2]);
    expect(stored.every((p) => p.origin == PostOrigin.remote), isTrue);
  });

  test('replacing the remote cache drops stale remote rows', () async {
    await dataSource.replaceRemoteCache([remote(1), remote(2)]);

    await dataSource.replaceRemoteCache([remote(2, title: 'atualizado')]);

    final stored = await dataSource.readAll();
    expect(stored.map((p) => p.remoteId), [2]);
    expect(stored.single.title, 'atualizado');
  });

  test(
    'replacing the remote cache never deletes posts created by the user',
    () async {
      final mine = local('local-1', createdAt: DateTime.utc(2026, 2, 1));
      await dataSource.saveLocalPost(mine);
      await dataSource.replaceRemoteCache([remote(1)]);

      await dataSource.replaceRemoteCache([remote(9)]);

      final stored = await dataSource.readAll();
      expect(stored.where((p) => p.isLocal), [mine]);
    },
  );

  test('lists the newest user posts first, then the remote ones', () async {
    await dataSource.replaceRemoteCache([remote(1), remote(2)]);
    await dataSource.saveLocalPost(
      local('local-old', createdAt: DateTime.utc(2026, 2, 1)),
    );
    await dataSource.saveLocalPost(
      local('local-new', createdAt: DateTime.utc(2026, 3, 1)),
    );

    final stored = await dataSource.readAll();

    expect(stored.map((p) => p.id), [
      'local-new',
      'local-old',
      'remote-1',
      'remote-2',
    ]);
  });

  test('reads a single post back by id', () async {
    await dataSource.replaceRemoteCache([remote(7)]);

    expect((await dataSource.findById('remote-7'))?.remoteId, 7);
    expect(await dataSource.findById('inexistente'), isNull);
  });

  test(
    'preserves the exact createdAt instant across a write/read cycle',
    () async {
      final instant = DateTime.utc(2026, 5, 4, 3, 2, 1, 123);
      await dataSource.saveLocalPost(local('local-1', createdAt: instant));

      final stored = await dataSource.readAll();

      expect(stored.single.createdAt.toUtc(), instant);
    },
  );
}
