import 'package:sqflite/sqflite.dart';
import 'dart:async';
import '../data/database_provider.dart';
import '../data/model/workout_plan.dart';

class ExerciseControl {
  Future addDummyData() async {
    // Test list of exercises
    List<ExercisePlan> exList = [
      ExercisePlan(name: 'Push-up', sets: 4),
      ExercisePlan(name: 'Pull-up', sets: 8),
      ExercisePlan(name: 'Sit-up', sets: 15),
      ExercisePlan(name: 'Squat', sets: 10),
      ExercisePlan(name: 'Biceps Curl', sets: 15),
    ];

    addExercisesMult(exList);
  }

  Future<List<ExercisePlan>> getAllExercises() async {
    final db = await DatabaseDriver.init();
    final List maps = await db.query('exercises');
    List<ExercisePlan> result = [];
    for (int i = 0; i < maps.length; i++) {
      result.add(ExercisePlan.fromMap(maps[i]));
    }
    return result;
  }

  Future<int> addExercise(ExercisePlan ex) async {
    final db = await DatabaseDriver.init();
    return db.insert('exercises', ex.toMap(),
        conflicAlgorithm: ConflictAlgorithm.replace);
  }

  Future addExercisesMult(List<ExercisePlan> exs) async {
    final db = await DatabaseDriver.init();
    exs.forEach((ex) {
      db.insert('exercises', ex.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    });
  }

  Future updateExercise(ExercisePlan ex) async {
    final db = await DatabaseDriver.init();
    return db
        .update('exercises', ex.toMap(), where: 'id = ?', whereArgs: [ex.id]);
  }

  Future deleteExercise(int id) async {
    final db = await DatabaseDriver.init();
    await db.delete('exercises', where: 'id = ?', whereArgs: [id]);
  }
}
