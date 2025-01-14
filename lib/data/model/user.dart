import 'package:life_balance_plus/data/model/workout_plan.dart';

import 'account.dart';
import 'fitness_logs.dart';

class User {
  Account account;
  List<WorkoutPlan> workoutPlans;
  FitnessLogs fitnessLogs;

  User(
      {required this.account,
      required this.workoutPlans,
      required this.fitnessLogs});
}
