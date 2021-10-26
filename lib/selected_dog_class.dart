import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:phi_dog/util/theme_notifier.dart';
import 'package:phi_dog/widget/dropdown_dog_heoght.dart';
import 'package:provider/provider.dart';

import 'choose_dogexercise.dart';

class SelectedDig extends StatelessWidget {
  const SelectedDig({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<ThemeNotifier>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 100),
            child: Text(
              'You choose dog ${bloc.selectedDog?.dogName}',
              style: TextStyle(
                  color: Theme.of(context).backgroundColor, fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 50, left: 20),
            child: DropDownMenu2(
              value: bloc.selectedDogHeight ?? bloc.selectedDog?.dogHeights![0],
              listMenue: bloc.selectedDog?.dogHeights,
              onPressed: (value) => bloc.selectedDodHeight(value!),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .3,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Align(
              alignment: Alignment.centerRight,
              child: RaisedButton(
                color: Theme.of(context).appBarTheme.backgroundColor,
                child: Text(
                  "Next",
                  style: TextStyle(color: Theme.of(context).backgroundColor),
                ),
                onPressed: bloc.selectedDogHeight == null
                    ? null
                    : () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: const DogExcerciseLevel(),
                                type: PageTransitionType.rightToLeft));
                      },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
