import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:phi_dog/total_overview_page.dart';
import 'package:phi_dog/util/theme_notifier.dart';
import 'package:provider/provider.dart';

class ResultPage extends StatelessWidget {
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
            padding: EdgeInsets.only(left: 16,top: 100),
            child: Text(
              'Result',
              style: TextStyle(
                  color: Theme.of(context).accentColor, fontSize: 20,fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16,top: 10),
            child: Text(
              'You choose dog ${bloc.selectedDog?.dogName ?? ""} with ${bloc.selectedDogHeight?.dogh}',
              style: TextStyle(
                  color: Theme.of(context).accentColor, fontSize: 20),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16,top:5),
            child: Text(
              'and ${bloc.selectedDoghLevel?.title ?? ""} excercise',
              style: TextStyle(
                  color: Theme.of(context).accentColor, fontSize: 20),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16,top: 10),
            child: Text(
              'Your dog weight should be',
              style: TextStyle(
                  color: Theme.of(context).accentColor, fontSize: 20),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(top: 50),
              width: MediaQuery.of(context).size.width*.7,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).appBarTheme.color,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16,top: 20),
            child: Text(
              'Your dog is to havy',
              style: TextStyle(
                  color: Theme.of(context).accentColor, fontSize: 20),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .09,
          ),
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Align(
              alignment: Alignment.centerRight,
              child: RaisedButton(
                color: Theme.of(context).appBarTheme.color,
                child: Text(
                  "Next",
                  style: TextStyle(
                      color: Theme.of(context).accentColor),
                ),
                onPressed: bloc.selectedDoghLevel == null
                    ? null
                    : () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: TotalOverViewPage(),
                          type: PageTransitionType
                              .rightToLeft));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
