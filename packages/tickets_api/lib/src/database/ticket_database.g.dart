// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorTicketDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$TicketDatabaseBuilder databaseBuilder(String name) =>
      _$TicketDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$TicketDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$TicketDatabaseBuilder(null);
}

class _$TicketDatabaseBuilder {
  _$TicketDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$TicketDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$TicketDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<TicketDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$TicketDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$TicketDatabase extends TicketDatabase {
  _$TicketDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  TicketDao? _ticketDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Ticket` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `date` INTEGER NOT NULL, `train` TEXT NOT NULL, `price` REAL NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  TicketDao get ticketDao {
    return _ticketDaoInstance ??= _$TicketDao(database, changeListener);
  }
}

class _$TicketDao extends TicketDao {
  _$TicketDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _ticketInsertionAdapter = InsertionAdapter(
            database,
            'Ticket',
            (Ticket item) => <String, Object?>{
                  'id': item.id,
                  'date': item.date,
                  'train': item.train,
                  'price': item.price
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Ticket> _ticketInsertionAdapter;

  @override
  Future<List<Ticket>> getAllTickets() async {
    return _queryAdapter.queryList('SELECT * FROM ticket',
        mapper: (Map<String, Object?> row) => Ticket(
            id: row['id'] as int?,
            date: row['date'] as int,
            train: row['train'] as String,
            price: row['price'] as double));
  }

  @override
  Future<void> deleteAllTickets() async {
    await _queryAdapter.queryNoReturn('DELETE FROM ticket');
  }

  @override
  Future<void> addTicket(Ticket ticket) async {
    await _ticketInsertionAdapter.insert(ticket, OnConflictStrategy.abort);
  }
}
