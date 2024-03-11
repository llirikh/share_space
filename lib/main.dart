import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:news/router/router.dart';
import 'package:news/theme/theme_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: Provider.of<ThemeProvider>(context).themeData,
      //darkTheme: darkMode,
      routerConfig: _router.config(),
    );
  }
}

