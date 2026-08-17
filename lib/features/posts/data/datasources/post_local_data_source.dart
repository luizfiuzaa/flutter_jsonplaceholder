import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';
import '../../domain/entities/post.dart';

abstract interface class PostLocalDataSource {
  Future<List<Post>> readAll();

  Future<void> replaceRemoteCache(List<Post> posts);

  Future<void> saveLocalPost(Post post);

  Future<Post?> findById(String id);
}

class DriftPostLocalDataSource implements PostLocalDataSource {
  const DriftPostLocalDataSource(this._db);

  final AppDatabase _db;

  @override
  Future<List<Post>> readAll() async {

    final localRows =
        await (_db.select(_db.postRows)
              ..where((row) => row.origin.equalsValue(PostOrigin.local))
              ..orderBy([(row) => OrderingTerm.desc(row.createdAt)]))
            .get();

    final remoteRows =
        await (_db.select(_db.postRows)
              ..where((row) => row.origin.equalsValue(PostOrigin.remote))
              ..orderBy([(row) => OrderingTerm.asc(row.remoteId)]))
            .get();

    return [...localRows, ...remoteRows].map(_toEntity).toList(growable: false);
  }

  @override
  Future<void> replaceRemoteCache(List<Post> posts) {
    return _db.transaction(() async {
      await (_db.delete(
        _db.postRows,
      )..where((row) => row.origin.equalsValue(PostOrigin.remote))).go();
      await _db.batch(
        (batch) => batch.insertAll(_db.postRows, posts.map(_toCompanion)),
      );
    });
  }

  @override
  Future<void> saveLocalPost(Post post) {
    return _db.into(_db.postRows).insertOnConflictUpdate(_toCompanion(post));
  }

  @override
  Future<Post?> findById(String id) async {
    final row =
        await (_db.select(_db.postRows)
              ..where((table) => table.id.equals(id))
              ..limit(1))
            .getSingleOrNull();

    return row == null ? null : _toEntity(row);
  }

  PostRowsCompanion _toCompanion(Post post) => PostRowsCompanion.insert(
    id: post.id,
    remoteId: Value(post.remoteId),
    userId: post.userId,
    title: post.title,
    body: post.body,
    origin: post.origin,
    createdAt: post.createdAt,
  );

  Post _toEntity(PostRow row) => Post(
    id: row.id,
    userId: row.userId,
    title: row.title,
    body: row.body,
    origin: row.origin,
    createdAt: row.createdAt,
    remoteId: row.remoteId,
  );
}
