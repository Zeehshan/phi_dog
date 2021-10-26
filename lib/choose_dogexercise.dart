import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:phi_dog/result_page.dart';
import 'package:phi_dog/widget/drop_down_dog_excerciselevel.dart';
import 'package:provider/provider.dart';

import 'util/theme_notifier.dart';

class DogExcerciseLevel extends StatelessWidget {
  const DogExcerciseLevel({Key? key}) : super(key: key);

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
              'You choose dog ${bloc.selectedDog!.dogName} with ${bloc.selectedDogHeight?.dogh}',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary, fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 50, left: 20),
            child: DropDownMenu3(
              value: bloc.selectedDoghLevel ??
                  bloc.selectedDog!.dogExerciseLevel![0],
              listMenue: bloc.selectedDog!.dogExerciseLevel,
              onPressed: (value) => bloc.setSelectedDoghLevel(value!),
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
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.secondary),
                ),
                onPressed: bloc.selectedDoghLevel == null
                    ? null
                    : () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: ResultPage(),
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
