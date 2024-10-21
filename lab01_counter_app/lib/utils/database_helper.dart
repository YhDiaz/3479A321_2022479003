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

  Future<void> insert(Audit audit) async {
    final db = await database;
    await db.insert(
      'audits',
      audit.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

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
}
