import 'package:flutter/material.dart';
import 'package:phi_dog/model/dogmodel.dart';

class DropDownMenu extends StatelessWidget {
  final ValueChanged<DogModel?>? onPressed;
  final List<DogModel>? listMenue;
  final DogModel? value;
  final DogModel? value2;
  const DropDownMenu({
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
        child: DropdownButton<DogModel>(
          style: TextStyle(color: Theme.of(context).accentColor, fontSize: 18),
          hint: const Text('Choose your dog'),
          iconSize: 20,
          value: value,
          isExpanded: true,
          items: listMenue!.map((value) {
            return DropdownMenuItem<DogModel>(
              value: value,
              child: Text(value.dogName!),
            );
          }).toList(),
          onChanged: onPressed,
        ),
      ),
    );
  }
}
