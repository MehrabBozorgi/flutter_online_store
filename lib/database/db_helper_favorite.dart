import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelperFavorite {
  static Future<Database> database() async {
    final dbPath = await getDatabasesPath();
    return await openDatabase(
      join(dbPath, 'favorite.db'),
      onCreate: (db, version) {
        db.execute(
            'CREATE TABLE user_favorite(id TEXT PRIMARY KEY, size TEXT, title TEXT, image TEXT, befor_price DOUBLE, after_price DOUBLE, description TEXT, year TEXT, kid_age TEXT, tedad INTEGER)');
      },
      version: 1,
    );
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DBHelperFavorite.database();
    db.insert(table, data, conflictAlgorithm: ConflictAlgorithm.ignore);
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DBHelperFavorite.database();
    return db.query(table);
  }

  static Future<int> delete(String id) async {
    final db = await DBHelperFavorite.database();

    return await db.delete(
      'user_favorite',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
