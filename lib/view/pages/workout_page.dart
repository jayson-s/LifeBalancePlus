import 'package:flutter/material.dart';
import '../../data/model/workout_plan.dart';
import '../../control/exercises_control.dart';

class WorkoutPage extends StatefulWidget {
  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  List<ExercisePlan> exs = [];

  Future<void> _loadExercises() async {
    final exs_ = await ExerciseControl().getAllExercises();
    setState(() {
      exs = exs_;
    });
  }

  @override
  void initState() {
    super.initState();
    // Uncomment this the first time you run to add some exercises to the local db
    // ExerciseControl().addDummyData();
    _loadExercises();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ListView.builder(
              itemCount: exs.length,
              itemBuilder: (context, index) {
                final ex = exs[index];
                return ListTile(
                  title: Text('${ex.name}'),
                  subtitle: Text('Sets: ${ex.sets}'),
                );
              })),
    );
  }
}
