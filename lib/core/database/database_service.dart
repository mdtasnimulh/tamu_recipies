import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tamu_recipes/data/models/meal/meal.dart';

class DatabaseService {
  static Database? _db;
  static final DatabaseService instance = DatabaseService._constructor();

  final String _mealTableName = "meals";
  final String _mealIdColumnName = "id";
  final String _mealTitleColumnName = "title";
  final String _mealDescriptionColumnName = "description";
  final String _mealStatusColumnName = "status";

  DatabaseService._constructor();

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await getDatabase();
    return _db!;
  }

  Future<Database> getDatabase() async {
    final databaseDirPath = await getDatabasesPath();
    final databasePath = join(databaseDirPath, "master_db.db");
    final database = await openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
            CREATE TABLE $_mealTableName (
              $_mealIdColumnName INTEGER PRIMARY KEY AUTOINCREMENT,
              $_mealTitleColumnName TEXT NOT NULL,
              $_mealDescriptionColumnName TEXT NOT NULL,
              $_mealStatusColumnName INTEGER NOT NULL DEFAULT 0
            )
          ''');
      },
    );

    return database;
  }

  void addTask(String title, String description) async {
    final db = await database;
    await db.insert(_mealTableName, {
      _mealTitleColumnName: title,
      _mealDescriptionColumnName: description,
    });
  }

  Future<List<Meal>> getMeal() async {
    final db = await database;
    final data = await db.query(_mealTableName);
    List<Meal> meal = data
        .map(
          (e) => Meal(
            id: e["id"] as int,
            title: e["title"] as String,
            description: e["description"] as String,
            status: e["status"] as int,
          ),
        )
        .toList();
    return meal;
  }

  void updateMealStatus(int id, int status) async {
    final db = await database;
    await db.update(
      _mealTableName,
      {_mealStatusColumnName: status},
      where: "$_mealIdColumnName = ?",
      whereArgs: [id],
    );
  }

  void deleteMeal(int id) async {
    final db = await database;
    await db.delete(
      _mealTableName,
      where: "$_mealIdColumnName = ?",
      whereArgs: [id],
    );
  }
}
