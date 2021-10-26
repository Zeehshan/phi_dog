import 'package:flutter/material.dart';
import 'package:phi_dog/anmeldung/auth.dart';
import 'package:phi_dog/anmeldung/loading.dart';
import 'package:phi_dog/basics/appbar.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: BaseAppBar(
        title: 'Phi-Dog',
        centerTitle: true,
      ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: RaisedButton(
            child: Text('Anmelden'),
            onPressed: () async {
              setState(() => loading = true);
              dynamic result = await _auth.signInAnon();
              if (result == null) {
                setState(() => loading = false);
                print('Anmeldefehler');
              } else {
                print('Angemeldet');
                print(result.uid);
              }
            }
          ),
        ),
    );
  }
}
