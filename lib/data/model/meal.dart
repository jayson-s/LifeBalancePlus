class Meal {
  int? id;
  String name;
  String mealType;
  double? fats;
  double? proteins;
  double? carbs;


  Meal({this.id,
    required this.name,
    required this.mealType,
    this.fats,
    this.proteins,
    this.carbs,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'mealType': mealType,
      'fats': fats,
      'proteins': proteins,
      'carbs': carbs,
    };
  }

  factory Meal.fromMap(Map<String, dynamic> map) {
    return Meal(
      id: map['id'],
      name: map['name'],
      mealType: map['mealType'],
      fats: map['fats'],
      proteins: map['proteins'],
      carbs: map['carbs'],
    );
  }

  @override
  String toString() {
    return 'Meal(id: $id, name: $name, mealType: $mealType, Macros: ($fats, $proteins, $carbs}))';
  }
}
