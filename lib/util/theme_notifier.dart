import 'package:flutter/material.dart';
import 'package:phi_dog/model/dogmodel.dart';
import 'package:phi_dog/values/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier with ChangeNotifier {
  final ThemeData? themeData;

  ThemeNotifier(this.themeData);

  getTheme() => themeData;

  setTheme(ThemeData themeData) async {
    themeData = themeData;
    notifyListeners();
    onThemeChanged(
      themeData == lightTheme ? true : false,
    );
  }

  bool? _selectedItem;
  bool get selected => _selectedItem ?? false;

  void setSelectedItem(bool s) {
    print(s);
    _selectedItem = s;
    notifyListeners();
    setTheme(!s ? darkTheme : lightTheme);
  }

  void onThemeChanged(bool value) async {
    print(value);
    print("in provider");
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool('lightMode', value);
  }

  DogModel? _selectedDog;
  DogModel? get selectedDog => _selectedDog;

  void setSelectedDog(DogModel s) {
    _selectedDog = s;
    notifyListeners();
  }

  DogHeight? selectedDogHeight;
  void selectedDodHeight(DogHeight height) {
    selectedDogHeight = height;
    notifyListeners();
  }

  DogExerciseLevel? _selectedDoghLevel;
  DogExerciseLevel? get selectedDoghLevel => _selectedDoghLevel;

  void setSelectedDoghLevel(DogExerciseLevel s) {
    _selectedDoghLevel = s;
    notifyListeners();
  }

  dynamic userTyoeDogWeight;
  clearEveryState(wght) {
    _selectedDoghLevel = null;
    selectedDogHeight = null;
    userTyoeDogWeight = wght;
    notifyListeners();
  }

  clearAllState() {
    _selectedDoghLevel = null;
    selectedDogHeight = null;
    userTyoeDogWeight = null;
    _selectedDog = null;
  }

  List<DogModel> listdog = [
    DogModel(dogId: 0, dogName: "Choose your dog"),
    DogModel(dogId: 1, dogName: "Dog1", gender: "weibchen", dogWieghts: [
      DogWieght(id: 1, dogw: 22),
      DogWieght(id: 2, dogw: 23),
      DogWieght(id: 2, dogw: 24),
    ], dogHeights: [
      DogHeight(id: 0, dogh: "Choose your dog height in "),
      DogHeight(id: 1, dogh: 120),
      DogHeight(id: 2, dogh: 150),
      DogHeight(id: 3, dogh: 180),
    ], dogExerciseLevel: <DogExerciseLevel>[
      DogExerciseLevel(title: "Choose dog excercise level", level: 0),
      DogExerciseLevel(title: "Less", level: 70),
      DogExerciseLevel(title: "Medium", level: 70),
      DogExerciseLevel(title: "Much", level: 70),
      DogExerciseLevel(title: "Very Much", level: 70),
    ]),
    DogModel(dogId: 2, dogName: "Dog2", gender: "weibchen", dogWieghts: [
      DogWieght(id: 1, dogw: 22),
      DogWieght(id: 2, dogw: 23),
      DogWieght(id: 2, dogw: 24),
    ], dogHeights: [
      DogHeight(id: 0, dogh: "Choose your dog height in "),
      DogHeight(id: 1, dogh: 121),
      DogHeight(id: 2, dogh: 151),
      DogHeight(id: 3, dogh: 181),
    ], dogExerciseLevel: <DogExerciseLevel>[
      DogExerciseLevel(title: "Choose your dog Exercise level", level: 0),
      DogExerciseLevel(title: "Less", level: 70),
      DogExerciseLevel(title: "Medium", level: 70),
      DogExerciseLevel(title: "Much", level: 70),
      DogExerciseLevel(title: "Very Much", level: 70),
    ]),
    DogModel(dogId: 3, dogName: "Dog3", gender: "weibchen", dogWieghts: [
      DogWieght(id: 1, dogw: 22),
      DogWieght(id: 2, dogw: 23),
      DogWieght(id: 2, dogw: 24),
    ], dogHeights: [
      DogHeight(id: 0, dogh: "Choose your dog height in "),
      DogHeight(id: 1, dogh: 122),
      DogHeight(id: 2, dogh: 152),
      DogHeight(id: 3, dogh: 182),
    ], dogExerciseLevel: <DogExerciseLevel>[
      DogExerciseLevel(title: "Choose your dog Exercise level", level: 0),
      DogExerciseLevel(title: "Less", level: 70),
      DogExerciseLevel(title: "Medium", level: 70),
      DogExerciseLevel(title: "Much", level: 70),
      DogExerciseLevel(title: "Very Much", level: 70),
    ]),
  ];
}
