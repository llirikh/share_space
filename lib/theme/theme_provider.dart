import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:news/theme/theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData =
      SchedulerBinding.instance.platformDispatcher.platformBrightness ==
              Brightness.light
          ? lightMode
          : darkMode;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }

  bool isDarkMode() {
    return _themeData == darkMode;
  }
}
