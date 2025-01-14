import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class DatabaseDriver {
  static Future init() async {
    var database =
        openDatabase(path.join(await getDatabasesPath(), 'database_manager.db'),
            onCreate: (db, version) async {
      // Account table
      await db.execute('''
          CREATE TABLE IF NOT EXISTS account(
            email TEXT PRIMARY KEY,
            firstName TEXT,
            lastName TEXT,
            height REAL,
            weight REAL,
            dateOfBirth TEXT
          )
          ''');

      // Exercise table
      await db.execute(
          'CREATE TABLE IF NOT EXISTS exercises(id INTEGER PRIMARY KEY, name TEXT, sets INTEGER)');

      // Meal table
      await db.execute('''
          CREATE TABLE IF NOT EXISTS meals(
            id INTEGER PRIMARY KEY,
            name TEXT,
            mealType TEXT,
            fats REAL,
            proteins REAL,
            carbs REAL
          )
          ''');

      await db.execute('''
          CREATE TABLE IF NOT EXISTS diets(
            id INTEGER PRIMARY KEY,
            dailyCals INTEGER,
            startDate DATE,
            endDate DATE,
            status TEXT
          )
          ''');

      await db.execute('''
           CREATE TABLE IF NOT EXISTS diets_meals(
             diet_id INTEGER NOT NULL,
             meal_id INTEGER NOT NULL,
             meal_date DATE,
             FOREIGN KEY (diet_id) REFERENCES diets (id),
             FOREIGN KEY (meal_id) REFERENCES meals (id),
           )
          ''');

      await db.execute('''
          CREATE TABLE IF NOT EXISTS workout_plans(
            id INTEGER PRIMARY KEY,
          )
          ''');

      await db.execute('''
          CREATE TABLE IF NOT EXISTS sessions(
            id INTEGER PRIMARY KEY,
            date DATE
          )
          ''');

      await db.execute('''
          CREATE TABLE IF NOT EXISTS exercise_plans(
            id INTEGER PRIMARY KEY,
            name TEXT,
            sets INTEGER
          )
          ''');

      await db.execute('''
          CREATE TABLE IF NOT EXISTS session_exercises(
            exercise_id INTEGER NOT NULL,
            session_id INTEGER NOT NULL,
            FOREIGN KEY (exercise_id) REFERENCES exercise_plans (id),
            FOREIGN KEY (session_id) REFERENCES sessions (id)
          )
          ''');

      await db.execute('''
          CRATE TABLE IF NOT EXISTS workout_sessions(
            workout_plan_id INTEGER NOT NULL,
            session_id INTEGER NOT NULL,
            FOREIGN KEY (workout_plan_id) REFERENCES workout_plans (id)
            FOREIGN KEY (session_id) REFERENCES sessions (id)
          )
          ''');
    }, version: 1);

    print("Created DB $database");
    return database;
  }
}
