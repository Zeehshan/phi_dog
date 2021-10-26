import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:phi_dog/util/theme_notifier.dart';
import 'package:provider/provider.dart';

import 'anmeldung/wrapper.dart';

class TotalOverViewPage extends StatelessWidget {
  const TotalOverViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<ThemeNotifier>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 20),
            child: Text(
              'Total overview',
              style: TextStyle(
                  color: Theme.of(context).backgroundColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 16),
            child: Container(
              padding: const EdgeInsets.only(left: 10, bottom: 15, top: 15),
              width: MediaQuery.of(context).size.width * .8,
              decoration: BoxDecoration(
                  color: Theme.of(context).appBarTheme.color,
                  borderRadius: BorderRadius.circular(6)),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: <Widget>[
                    Text(
                      "Dog name : ",
                      style: TextStyle(
                          color: Theme.of(context).backgroundColor,
                          fontSize: 20),
                    ),
                    Text(
                      bloc.selectedDog?.dogName ?? "",
                      style: TextStyle(
                          color: Theme.of(context).backgroundColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 16),
            child: Container(
              padding: const EdgeInsets.only(left: 10, bottom: 15, top: 15),
              width: MediaQuery.of(context).size.width * .8,
              decoration: BoxDecoration(
                  color: Theme.of(context).appBarTheme.backgroundColor,
                  borderRadius: BorderRadius.circular(6)),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: <Widget>[
                    Text(
                      "Dog height : ",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 20),
                    ),
                    Text(
                      bloc.selectedDogHeight!.dogh.toString() + "cm",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 16),
            child: Container(
              padding: const EdgeInsets.only(left: 10, bottom: 15, top: 15),
              width: MediaQuery.of(context).size.width * .8,
              decoration: BoxDecoration(
                  color: Theme.of(context).appBarTheme.color,
                  borderRadius: BorderRadius.circular(6)),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: <Widget>[
                    Text(
                      "Dog excercise level : ",
                      style: TextStyle(
                          color: Theme.of(context).backgroundColor,
                          fontSize: 20),
                    ),
                    Text(
                      bloc.selectedDoghLevel?.title.toString() ?? "",
                      style: TextStyle(
                          color: Theme.of(context).backgroundColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 16),
            child: Container(
              padding: const EdgeInsets.only(left: 10, bottom: 15, top: 15),
              width: MediaQuery.of(context).size.width * .8,
              decoration: BoxDecoration(
                  color: Theme.of(context).appBarTheme.backgroundColor,
                  borderRadius: BorderRadius.circular(6)),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: <Widget>[
                    Text(
                      "Dog Actual Weight : ",
                      style: TextStyle(
                          color: Theme.of(context).backgroundColor,
                          fontSize: 20),
                    ),
                    Text(
                      bloc.userTyoeDogWeight.toString() + "KG",
                      style: TextStyle(
                          color: Theme.of(context).backgroundColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .1,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: MediaQuery.of(context).size.width * .7,
              height: 50,
              decoration: BoxDecoration(
                  color: Theme.of(context).appBarTheme.backgroundColor,
                  borderRadius: BorderRadius.circular(6)),
              child: FlatButton(
                onPressed: () {},
                child: const Center(
                  child: Text("Send Report to E-Mail"),
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .1,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Align(
              alignment: Alignment.centerRight,
              child: RaisedButton(
                color: Theme.of(context).appBarTheme.color,
                child: Text(
                  "Home",
                  style: TextStyle(color: Theme.of(context).backgroundColor),
                ),
                onPressed: bloc.selectedDoghLevel == null
                    ? null
                    : () {
                        bloc.clearAllState();
//                  Navigator.pushReplacement(context, PageTransition(child: Wrapper(),type: PageTransitionType.rightToLeft));
                        Navigator.pushAndRemoveUntil(
                            context,
                            PageTransition(
                                child: const Wrapper(),
                                type: PageTransitionType.rightToLeft),
                            (route) => false);
                      },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
