import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBUtil {
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath, 'pets.db'),
        onCreate: (db, version) {
      _createDb(db);
    }, version: 1);
  }

  static void _createDb(sql.Database db) {
    db.execute("""
    CREATE TABLE pets (id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR(50), imageUrl TEXT, 
    descricao TEXT, idade INTEGER, sexo VARCHAR(8), cor VARCHAR(20), bio TEXT)
    """);
  }

  static Future<void> insertData(String table, Map<String, Object> dados) async {
    final db = await database();
    await db.insert(table, dados, conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await database();
    return db.query(table);
  }
}