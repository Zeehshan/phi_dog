import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  appBarTheme: AppBarTheme(
    color: Colors.cyan[700],
  ),
  primarySwatch: Colors.grey,
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  backgroundColor: const Color(0xFF212121),
//backgroundColor: Colors.cyan[700],
  accentColor: Colors.white,
  accentIconTheme: IconThemeData(color: Colors.black),
  dividerColor: Colors.black12,
);

final lightTheme = ThemeData(
  appBarTheme: AppBarTheme(
    color: Colors.cyan,
  ),
  primarySwatch: Colors.grey,
  primaryColor: Colors.white,
  brightness: Brightness.light,
  backgroundColor: const Color(0xFFE0FFFF),
//backgroundColor: Colors.cyan,
  scaffoldBackgroundColor: const Color(0xFFE0FFFF3),
  accentColor: Colors.black,
  accentIconTheme: IconThemeData(color: Colors.white),
  dividerColor: Colors.white54,
);