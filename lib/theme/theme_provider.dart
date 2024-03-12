import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:news/theme/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeDataPreferences {
  static const String key = "themeData";
  static const String lightMode = "lightMode";
  static const String darkMode = "darkMode";
}

class ThemeProvider with ChangeNotifier {
  final SharedPreferences _prefs;
  late ThemeData _themeData;

  void _setThemeDataPreferences() {
    String value;
    if (_themeData == lightMode) {
      value = ThemeDataPreferences.lightMode;
    } else {
      value = ThemeDataPreferences.darkMode;
    }

    _prefs.setString(ThemeDataPreferences.key, value);
  }

  ThemeData _getInitializeThemeData() {
    String? value = _prefs.getString(ThemeDataPreferences.key);
    if (value == null) {
      final platformBrightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
      bool isDarkMode = platformBrightness == Brightness.dark;
      if (isDarkMode) {
        return darkMode;
      }
      return lightMode;
    }
    if (value == ThemeDataPreferences.lightMode) {
      return lightMode;
    }
    return darkMode;
  }

  ThemeProvider(this._prefs) {
    _themeData = _getInitializeThemeData();
    notifyListeners();
    _setThemeDataPreferences();
  }

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
    _setThemeDataPreferences();
  }

  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
    notifyListeners();
    _setThemeDataPreferences();
  }

  bool isDarkMode() {
    return _themeData == darkMode;
  }
}
