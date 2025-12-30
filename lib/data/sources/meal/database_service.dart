import 'package:dartz/dartz.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tamu_recipes/data/models/meal/meal.dart';

abstract class DatabaseService {
  Future<Either> getMeal();

  Future<Either> addMeal(String title, String description);

  Future<Either> updateMealStatus(int id, int status);

  Future<Either> deleteMeal(int id);
}

class DatabaseServiceImpl extends DatabaseService {
  static Database? _db;

  final String _mealTableName = "meals";
  final String _mealIdColumnName = "id";
  final String _mealTitleColumnName = "title";
  final String _mealDescriptionColumnName = "description";
  final String _mealStatusColumnName = "status";

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

  @override
  Future<Either> addMeal(String title, String description) async {
    try {
      final db = await database;
      return Right(
        await db.insert(_mealTableName, {
          _mealTitleColumnName: title,
          _mealDescriptionColumnName: description,
        }),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either> deleteMeal(int id) async {
    final db = await database;
    try {
      return Right(
        await db.delete(
          _mealTableName,
          where: "$_mealIdColumnName = ?",
          whereArgs: [id],
        ),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either> getMeal() async {
    final db = await database;
    final data = await db.query(_mealTableName);
    try {
      return Right(
        data
            .map(
              (e) => Meal(
                id: e["id"] as int,
                title: e["title"] as String,
                description: e["description"] as String,
                status: e["status"] as int,
              ),
            )
            .toList(),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either> updateMealStatus(int id, int status) async {
    final db = await database;
    try {
      return Right(
        await db.update(
          _mealTableName,
          {_mealStatusColumnName: status},
          where: "$_mealIdColumnName = ?",
          whereArgs: [id],
        ),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }
}
