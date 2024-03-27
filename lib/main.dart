import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:news/repository/repository.dart';
import 'package:news/theme/theme_provider.dart';
import 'package:news/share_space.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();

  final BaseApi api = ApiV4();
  final BaseArticleCollection articleCollection = ArticleCollection(api);
  GetIt.instance.registerLazySingleton(() => articleCollection);

  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(prefs),
    child: const ShareSpace(),
  ));
}