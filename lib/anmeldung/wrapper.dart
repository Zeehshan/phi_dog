import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:phi_dog/menu_dashboard_layout.dart';
import 'package:phi_dog/anmeldung/authenticate.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    // return either Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return MenuDashboardPage();
    }
  }
}
