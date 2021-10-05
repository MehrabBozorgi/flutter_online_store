import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelperCart {
  static Future<Database> database() async {
    final dbPath = await getDatabasesPath();

    return await openDatabase(
      join(dbPath, 'user_cart.db'),
      onCreate: (db, version) {
        db.execute(
            'CREATE TABLE user_cart(id TEXT PRIMARY KEY, title TEXT, image TEXT, befor_price DOUBLE, after_price DOUBLE, tedad INTEGER)');
      },
      version: 1,
    );
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DBHelperCart.database();
    db.insert(table, data, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DBHelperCart.database();
    return db.query(table);
  }

  static Future<void> deleteAll() async {
    final db = await DBHelperCart.database();
    return await db.execute("delete from " + 'user_cart');
  }

  static Future<int> delete(String id) async {
    final db = await DBHelperCart.database();

    return await db.delete(
      'user_cart',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  static Future<int> update(String id, Map<String, Object> data) async {
    final db = await DBHelperCart.database();
    var result = await db.update(
      'user_cart',
      data,
      where: "id = ?",
      whereArgs: [id],
      conflictAlgorithm: ConflictAlgorithm.rollback,
    );
    return result;
  }
}
