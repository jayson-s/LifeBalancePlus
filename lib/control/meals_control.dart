import 'package:sqflite/sqflite.dart';
import 'dart:async';
import '../data/database_provider.dart';
import '../data/model/meal.dart';

class MealControl {
  Future addDummyData() async {
    // Test list of Meals
    List<Meal> mealList = [
      Meal(
          name: 'Protein Bar',
          mealType: 'snack',
          fats: 12.5,
          proteins: 8.0,
          carbs: 3.5),
      Meal(
          name: 'Omelette',
          mealType: 'breakfast',
          fats: 15.0,
          proteins: 20.0,
          carbs: 2.0),
      Meal(
          name: 'Green Salad',
          mealType: 'lunch',
          fats: 5.0,
          proteins: 2.0,
          carbs: 10.0),
      Meal(
          name: 'Grilled Chicken',
          mealType: 'dinner',
          fats: 8.0,
          proteins: 25.0,
          carbs: 0.5),
      Meal(
          name: 'Greek Yogurt',
          mealType: 'snack',
          fats: 2.5,
          proteins: 15.0,
          carbs: 6.0),
      Meal(
          name: 'Chocolate Cake',
          mealType: 'dessert',
          fats: 20.0,
          proteins: 5.0,
          carbs: 30.0),
    ];

    addMealsMult(mealList);
  }

  Future<List<Meal>> getAllMeals() async {
    final db = await DatabaseDriver.init();
    final List maps = await db.query('meals');
    List<Meal> result = [];
    for (int i = 0; i < maps.length; i++) {
      result.add(Meal.fromMap(maps[i]));
    }
    return result;
  }

  Future<int> addMeal(Meal meal) async {
    final db = await DatabaseDriver.init();
    return db.insert('meals', meal.toMap(),
        conflicAlgorithm: ConflictAlgorithm.replace);
  }

  Future addMealsMult(List<Meal> meals) async {
    final db = await DatabaseDriver.init();
    meals.forEach((meal) {
      db.insert('meals', meal.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    });
  }

  Future updateMeal(Meal meal) async {
    final db = await DatabaseDriver.init();
    return db
        .update('meals', meal.toMap(), where: 'id = ?', whereArgs: [meal.id]);
  }

  Future deleteMeal(int id) async {
    final db = await DatabaseDriver.init();
    await db.delete('meals', where: 'id = ?', whereArgs: [id]);
  }
}
