class DogModel {
  final int? dogId;
  final String? dogName;
  final String? gender;
  final List<DogHeight>? dogHeights;
  final List<DogWieght>? dogWieghts;
  final List<DogExerciseLevel>? dogExerciseLevel;
  DogModel(
      {this.dogId,
      this.dogName,
      this.gender,
      this.dogHeights,
      this.dogWieghts,
      this.dogExerciseLevel});
}

class DogHeight {
  final int? id;
  final dynamic dogh;
  DogHeight({this.dogh, this.id});
}

class DogWieght {
  final int? id;
  final dynamic dogw;
  DogWieght({this.dogw, this.id});
}

class DogExerciseLevel {
  final double? level;
  final String? title;
  DogExerciseLevel({this.level, this.title});
}
