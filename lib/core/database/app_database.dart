import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../features/posts/domain/entities/post.dart';
import 'tables/post_rows.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [PostRows])
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.executor);

  AppDatabase.inMemory() : super(NativeDatabase.memory());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) => m.createAll(),
    beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON');
    },
  );

  static Future<AppDatabase> open() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File(p.join(directory.path, 'json_placeholder_test.sqlite'));
    return AppDatabase(NativeDatabase(file));
  }
}
