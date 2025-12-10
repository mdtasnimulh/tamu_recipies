import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static Database? _db;
  static final DatabaseService instance = DatabaseService._constructor();

  final String _mealTableName = "meals";
  final String _mealIdColumnName = "id";
  final String _mealTitleColumnName = "title";
  final String _mealDescriptionColumnName = "description";

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
      onCreate: (db, version) {
        db.execute(
          '''
            CREATE TABLE $_mealTableName (
              $_mealIdColumnName INTEGER PRIMARY KEY AUTOINCREMENT,
              $_mealTitleColumnName TEXT NOT NULL,
              $_mealDescriptionColumnName TEXT NOT NULL
            )
          '''
        );
      }
    );

    return database;
  }


}