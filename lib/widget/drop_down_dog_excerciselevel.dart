import 'package:flutter/material.dart';
import 'package:phi_dog/model/dogmodel.dart';

class DropDownMenu3 extends StatelessWidget {
  final ValueChanged<DogExerciseLevel?>? onPressed;
  final List<DogExerciseLevel>? listMenue;
  final DogExerciseLevel? value;
  final DogExerciseLevel? value2;
  const DropDownMenu3({
    Key? key,
    this.onPressed,
    this.listMenue,
    this.value,
    this.value2,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Theme.of(context).appBarTheme.backgroundColor!,
          Theme.of(context).appBarTheme.backgroundColor!,
        ])),
        child: DropdownButton<DogExerciseLevel>(
          style: TextStyle(
              color: Theme.of(context).colorScheme.secondary, fontSize: 18),
          hint: const Text('Choose your dog Exercise level'),
          iconSize: 20,
          value: value,
          isExpanded: true,
          items: listMenue!.map((value) {
            return DropdownMenuItem<DogExerciseLevel>(
              value: value,
              child: Text(value.title.toString()),
            );
          }).toList(),
          onChanged: onPressed,
        ),
      ),
    );
  }
}
