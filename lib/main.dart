import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phi_dog/anmeldung/wrapper.dart';
import 'package:phi_dog/anmeldung/auth.dart';
import 'package:phi_dog/util/theme_notifier.dart';
import 'package:phi_dog/values/theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool keytheme = false;
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom]).then((_) {
    SharedPreferences.getInstance().then((prefs) {
      var lightMode = prefs.getBool('lightMode') ?? true;
      print("in main");
      keytheme = lightMode ? true : false;
      print(lightMode);
      runApp(
        ChangeNotifierProvider<ThemeNotifier>.value(
          value: ThemeNotifier((lightMode ? lightTheme : darkTheme)),
          child: const MyApp(),
        ),
      );
    });
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application   .
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return StreamProvider.value(
      initialData: null,
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeNotifier.getTheme(),
        home: const Wrapper(),
      ),
    );
  }
}
