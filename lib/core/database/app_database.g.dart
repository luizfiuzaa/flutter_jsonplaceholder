// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $PostRowsTable extends PostRows with TableInfo<$PostRowsTable, PostRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PostRowsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _remoteIdMeta = const VerificationMeta(
    'remoteId',
  );
  @override
  late final GeneratedColumn<int> remoteId = GeneratedColumn<int>(
    'remote_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
    'body',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<PostOrigin, String> origin =
      GeneratedColumn<String>(
        'origin',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<PostOrigin>($PostRowsTable.$converterorigin);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    remoteId,
    userId,
    title,
    body,
    origin,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'post_rows';
  @override
  VerificationContext validateIntegrity(
    Insertable<PostRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('remote_id')) {
      context.handle(
        _remoteIdMeta,
        remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta),
      );
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
        _bodyMeta,
        body.isAcceptableOrUnknown(data['body']!, _bodyMeta),
      );
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PostRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PostRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      remoteId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}remote_id'],
      ),
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      body: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}body'],
      )!,
      origin: $PostRowsTable.$converterorigin.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}origin'],
        )!,
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $PostRowsTable createAlias(String alias) {
    return $PostRowsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<PostOrigin, String, String> $converterorigin =
      const EnumNameConverter<PostOrigin>(PostOrigin.values);
}

class PostRow extends DataClass implements Insertable<PostRow> {
  final String id;

  final int? remoteId;
  final int userId;
  final String title;
  final String body;

  final PostOrigin origin;
  final DateTime createdAt;
  const PostRow({
    required this.id,
    this.remoteId,
    required this.userId,
    required this.title,
    required this.body,
    required this.origin,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<int>(remoteId);
    }
    map['user_id'] = Variable<int>(userId);
    map['title'] = Variable<String>(title);
    map['body'] = Variable<String>(body);
    {
      map['origin'] = Variable<String>(
        $PostRowsTable.$converterorigin.toSql(origin),
      );
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  PostRowsCompanion toCompanion(bool nullToAbsent) {
    return PostRowsCompanion(
      id: Value(id),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      userId: Value(userId),
      title: Value(title),
      body: Value(body),
      origin: Value(origin),
      createdAt: Value(createdAt),
    );
  }

  factory PostRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PostRow(
      id: serializer.fromJson<String>(json['id']),
      remoteId: serializer.fromJson<int?>(json['remoteId']),
      userId: serializer.fromJson<int>(json['userId']),
      title: serializer.fromJson<String>(json['title']),
      body: serializer.fromJson<String>(json['body']),
      origin: $PostRowsTable.$converterorigin.fromJson(
        serializer.fromJson<String>(json['origin']),
      ),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'remoteId': serializer.toJson<int?>(remoteId),
      'userId': serializer.toJson<int>(userId),
      'title': serializer.toJson<String>(title),
      'body': serializer.toJson<String>(body),
      'origin': serializer.toJson<String>(
        $PostRowsTable.$converterorigin.toJson(origin),
      ),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  PostRow copyWith({
    String? id,
    Value<int?> remoteId = const Value.absent(),
    int? userId,
    String? title,
    String? body,
    PostOrigin? origin,
    DateTime? createdAt,
  }) => PostRow(
    id: id ?? this.id,
    remoteId: remoteId.present ? remoteId.value : this.remoteId,
    userId: userId ?? this.userId,
    title: title ?? this.title,
    body: body ?? this.body,
    origin: origin ?? this.origin,
    createdAt: createdAt ?? this.createdAt,
  );
  PostRow copyWithCompanion(PostRowsCompanion data) {
    return PostRow(
      id: data.id.present ? data.id.value : this.id,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      userId: data.userId.present ? data.userId.value : this.userId,
      title: data.title.present ? data.title.value : this.title,
      body: data.body.present ? data.body.value : this.body,
      origin: data.origin.present ? data.origin.value : this.origin,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PostRow(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('userId: $userId, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('origin: $origin, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, remoteId, userId, title, body, origin, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PostRow &&
          other.id == this.id &&
          other.remoteId == this.remoteId &&
          other.userId == this.userId &&
          other.title == this.title &&
          other.body == this.body &&
          other.origin == this.origin &&
          other.createdAt == this.createdAt);
}

class PostRowsCompanion extends UpdateCompanion<PostRow> {
  final Value<String> id;
  final Value<int?> remoteId;
  final Value<int> userId;
  final Value<String> title;
  final Value<String> body;
  final Value<PostOrigin> origin;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const PostRowsCompanion({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.userId = const Value.absent(),
    this.title = const Value.absent(),
    this.body = const Value.absent(),
    this.origin = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PostRowsCompanion.insert({
    required String id,
    this.remoteId = const Value.absent(),
    required int userId,
    required String title,
    required String body,
    required PostOrigin origin,
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       userId = Value(userId),
       title = Value(title),
       body = Value(body),
       origin = Value(origin),
       createdAt = Value(createdAt);
  static Insertable<PostRow> custom({
    Expression<String>? id,
    Expression<int>? remoteId,
    Expression<int>? userId,
    Expression<String>? title,
    Expression<String>? body,
    Expression<String>? origin,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (remoteId != null) 'remote_id': remoteId,
      if (userId != null) 'user_id': userId,
      if (title != null) 'title': title,
      if (body != null) 'body': body,
      if (origin != null) 'origin': origin,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PostRowsCompanion copyWith({
    Value<String>? id,
    Value<int?>? remoteId,
    Value<int>? userId,
    Value<String>? title,
    Value<String>? body,
    Value<PostOrigin>? origin,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return PostRowsCompanion(
      id: id ?? this.id,
      remoteId: remoteId ?? this.remoteId,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      body: body ?? this.body,
      origin: origin ?? this.origin,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<int>(remoteId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (origin.present) {
      map['origin'] = Variable<String>(
        $PostRowsTable.$converterorigin.toSql(origin.value),
      );
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PostRowsCompanion(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('userId: $userId, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('origin: $origin, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PostRowsTable postRows = $PostRowsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [postRows];
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}

typedef $$PostRowsTableCreateCompanionBuilder =
    PostRowsCompanion Function({
      required String id,
      Value<int?> remoteId,
      required int userId,
      required String title,
      required String body,
      required PostOrigin origin,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$PostRowsTableUpdateCompanionBuilder =
    PostRowsCompanion Function({
      Value<String> id,
      Value<int?> remoteId,
      Value<int> userId,
      Value<String> title,
      Value<String> body,
      Value<PostOrigin> origin,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$PostRowsTableFilterComposer
    extends Composer<_$AppDatabase, $PostRowsTable> {
  $$PostRowsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<PostOrigin, PostOrigin, String> get origin =>
      $composableBuilder(
        column: $table.origin,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PostRowsTableOrderingComposer
    extends Composer<_$AppDatabase, $PostRowsTable> {
  $$PostRowsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get origin => $composableBuilder(
    column: $table.origin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PostRowsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PostRowsTable> {
  $$PostRowsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<int> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get body =>
      $composableBuilder(column: $table.body, builder: (column) => column);

  GeneratedColumnWithTypeConverter<PostOrigin, String> get origin =>
      $composableBuilder(column: $table.origin, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$PostRowsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PostRowsTable,
          PostRow,
          $$PostRowsTableFilterComposer,
          $$PostRowsTableOrderingComposer,
          $$PostRowsTableAnnotationComposer,
          $$PostRowsTableCreateCompanionBuilder,
          $$PostRowsTableUpdateCompanionBuilder,
          (PostRow, BaseReferences<_$AppDatabase, $PostRowsTable, PostRow>),
          PostRow,
          PrefetchHooks Function()
        > {
  $$PostRowsTableTableManager(_$AppDatabase db, $PostRowsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PostRowsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PostRowsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PostRowsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<int?> remoteId = const Value.absent(),
                Value<int> userId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> body = const Value.absent(),
                Value<PostOrigin> origin = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PostRowsCompanion(
                id: id,
                remoteId: remoteId,
                userId: userId,
                title: title,
                body: body,
                origin: origin,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<int?> remoteId = const Value.absent(),
                required int userId,
                required String title,
                required String body,
                required PostOrigin origin,
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => PostRowsCompanion.insert(
                id: id,
                remoteId: remoteId,
                userId: userId,
                title: title,
                body: body,
                origin: origin,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PostRowsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PostRowsTable,
      PostRow,
      $$PostRowsTableFilterComposer,
      $$PostRowsTableOrderingComposer,
      $$PostRowsTableAnnotationComposer,
      $$PostRowsTableCreateCompanionBuilder,
      $$PostRowsTableUpdateCompanionBuilder,
      (PostRow, BaseReferences<_$AppDatabase, $PostRowsTable, PostRow>),
      PostRow,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PostRowsTableTableManager get postRows =>
      $$PostRowsTableTableManager(_db, _db.postRows);
}
