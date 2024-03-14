import 'package:flutter/material.dart';
import 'package:news/router/router.dart';
import 'package:provider/provider.dart';
import 'package:news/theme/theme_provider.dart';

class ShareSpace extends StatefulWidget {
  const ShareSpace({super.key});

  @override
  State<ShareSpace> createState() => _ShareSpaceState();
}

class _ShareSpaceState extends State<ShareSpace> {
  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: Provider.of<ThemeProvider>(context).themeData,
      routerConfig: _router.config(),
    );
  }
}