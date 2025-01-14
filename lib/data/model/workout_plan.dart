class WorkoutPlan {

  /// List of sessions in a workout plan, where the sessions are lists of
  /// exercises. Empty exercise lists denote rest days.
  List<List<ExercisePlan>> sessions;

  WorkoutPlan({required this.sessions});
}


class ExercisePlan {
  int? id;
  String name;
  int? sets;

  ExercisePlan({this.id, required this.name, this.sets});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'sets': sets,
    };
  }

  factory ExercisePlan.fromMap(Map<String, dynamic> map) {
    return ExercisePlan(
      id: map['id'],
      name: map['name'],
      sets: map['sets'],
    );
  }

  @override
  String toString() {
    return 'Exercise(id: $id, name: $name, sets: $sets)';
  }
}
