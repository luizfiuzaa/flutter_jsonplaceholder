import 'package:drift/drift.dart';

import '../../../features/posts/domain/entities/post.dart';

@DataClassName('PostRow')
class PostRows extends Table {
  TextColumn get id => text()();

  IntColumn get remoteId => integer().nullable()();

  IntColumn get userId => integer()();

  TextColumn get title => text()();

  TextColumn get body => text()();

  TextColumn get origin => textEnum<PostOrigin>()();

  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
