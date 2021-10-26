import 'package:flutter/material.dart';
import 'package:phi_dog/model/dogmodel.dart';

class DropDownMenu2 extends StatelessWidget {
  final ValueChanged<DogHeight?>? onPressed;
  final List<DogHeight>? listMenue;
  final DogHeight? value;
  final DogHeight? value2;
  const DropDownMenu2({
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
        child: DropdownButton<DogHeight>(
          style: TextStyle(color: Theme.of(context).accentColor, fontSize: 18),
          hint: const Text('Choose your dog height'),
          iconSize: 20,
          value: value,
          isExpanded: true,
          items: listMenue!.map((value) {
            return DropdownMenuItem<DogHeight>(
              value: value,
              child: Text(value.dogh.toString() + "cm"),
            );
          }).toList(),
          onChanged: onPressed,
        ),
      ),
    );
  }
}
