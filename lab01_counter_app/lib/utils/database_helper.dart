
import 'package:lab01_counter_app/models/audit.dart';
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
    final path = '$databasePath/notes.db';
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
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

  Future<Audit> insert(Audit audit) async {
    final db = await instance.database;
    final id = await db.insert('audits', audit.toJson());
    return audit.copy(id: id);
  }

  Future<Audit> recovery(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      'audits',
      columns: [
        'id',
        'action'
      ],
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Audit.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }
}
