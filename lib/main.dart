import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:news/share_space.dart';
import 'package:news/theme/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(prefs),
    child: const ShareSpace(),
  ));
}