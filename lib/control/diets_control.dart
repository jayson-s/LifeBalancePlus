import 'package:sqflite/sqflite.dart';
import 'dart:async';
import '../data/database_provider.dart';
import '../data/model/diet.dart';

class DietControl {
  Future<List<Diet>> getAllDiets() async {
    final db = await DatabaseDriver.init();
    final List maps = await db.query('diets');
    List<Diet> result = [];
    for (int i = 0; i < maps.length; i++) {
      result.add(Diet.fromMap(maps[i]));
    }
    return result;
  }

  Future<int> addDiet(Diet diet) async {
    final db = await DatabaseDriver.init();
    return db.insert('diets', diet.toMap(),
        conflicAlgorithm: ConflictAlgorithm.replace);
  }

  Future addDietsMult(List<Diet> diets) async {
    final db = await DatabaseDriver.init();
    diets.forEach((ex) {
      db.insert('diets', ex.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    });
  }

  Future updateDiet(Diet diet) async {
    final db = await DatabaseDriver.init();
    return db
        .update('diets', diet.toMap(), where: 'id = ?', whereArgs: [diet.id]);
  }

  Future deleteDiet(int id) async {
    final db = await DatabaseDriver.init();
    await db.delete('diets', where: 'id = ?', whereArgs: [id]);
  }
}
