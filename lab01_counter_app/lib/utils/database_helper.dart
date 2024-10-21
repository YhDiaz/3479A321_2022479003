import 'package:lab01_counter_app/models/audit.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._internal();
  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = '$databasePath/audits.db';
    return await openDatabase(
      join(await getDatabasesPath(), 'audits.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE audits(id INTEGER PRIMARY KEY, action TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    return await db.execute('''
        CREATE TABLE audits (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          action TEXT NOT NULL
        )
      ''');
  }

  Future<void> insert(Audit audit) async {
    final db = await database;
    await db.insert(
      'audits',
      audit.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Future<Audit> insert(Audit audit) async {
  //   final db = await instance.database;
  //   final id = await db.insert('audits', audit.toJson());
  //   return audit.copy(id: id);
  // }

  Future<List<Audit>> read() async {
    final db = await database;
    final List<Map<String, Object?>> auditMaps = await db.query('audits');
    return [
      for (final {
            'id': id as int,
            'action': action as String,
          } in auditMaps)
        Audit(id: id, action: action),
    ];
  }

  // Future<Audit> recovery(int id) async {
  //   final db = await instance.database;
  //   final maps = await db.query(
  //     'audits',
  //     columns: [
  //       'id',
  //       'action'
  //     ],
  //     where: 'id = ?',
  //     whereArgs: [id],
  //   );

  //   if (maps.isNotEmpty) {
  //     return Audit.fromJson(maps.first);
  //   } else {
  //     throw Exception('ID $id not found');
  //   }
  // }

  // Future<List<Audit>> readAll() async {
  //   final db = await instance.database;
  //   const orderBy = 'id DESC';
  //   final result = await db.query('audits', orderBy: orderBy);
  //   return result.map((json) => Audit.fromJson(json)).toList();
  // }
}
