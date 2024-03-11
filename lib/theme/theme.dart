import 'package:flutter/material.dart';

const primaryColor = Colors.red;

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  primaryColor: primaryColor,
  scaffoldBackgroundColor: const Color(0xFFEFF1F3).withOpacity(1),
  colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
  useMaterial3: true,
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  primaryColor: primaryColor,
  scaffoldBackgroundColor: Colors.black,
  //colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
  useMaterial3: true
);