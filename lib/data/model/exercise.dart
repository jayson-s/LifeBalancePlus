class Exercise {
  String name;
  String description;
  List<MuscleGroup> muscleGroups;
  List<Equipment> requiredEquipment;

  Exercise({
    required this.name,
    required this.description,
    required this.muscleGroups,
    required this.requiredEquipment,
  });
}


enum MuscleGroup {
  anteriorDelts,
  biceps,
  calves,
  chest,
  core,
  forearms,
  glutes,
  hamstrings,
  lats,
  lowerBack,
  medialDelts,
  neck,
  other,
  posteriorDelts,
  quadriceps,
  triceps,
  upperBack,
}

enum Equipment {
  adjustableBench,
  barbell,
  cableMachine,
  curlBar,
  dumbbells,
  exerciseBall,
  flatBench,
  kettlebell,
  medicineBall,
  powerRack,
  pullUpBar,
  specializedMachine,
}
