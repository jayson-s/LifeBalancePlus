class FitnessLogs {
  List<SessionLog> entries;

  FitnessLogs({required this.entries});

  void addSessionEntry(SessionLog session) {
    entries.add(session);
  }
}


class SessionLog {
  DateTime date;
  List<SetLog> sets;
  List<String> notes;

  SessionLog({required this.date, required this.sets, required this.notes});
}


class SetLog {
  String exerciseName;

  SetLog({required this.exerciseName});
}

class CardioSetLog extends SetLog {
  double duration;
  double avgSpeed;

  CardioSetLog({required super.exerciseName, required this.duration, required this.avgSpeed});
}

class ResistanceSetLog extends SetLog {
  int reps;
  double weight;

  ResistanceSetLog({required super.exerciseName, required this.reps, required this.weight});
}
