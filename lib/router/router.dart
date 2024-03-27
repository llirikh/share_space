import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

import '../models/article/article.dart';
import '../features/article/article.dart';
import '../features/article_navigation/article_navigation.dart';
import '../features/home/home.dart';
import '../features/article_list/article_list.dart';
import '../features/settings/settings.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
            page: HomeRoute.page,
            path: '/',
            children: [
              AutoRoute(
                page: ArticleNavigationRoute.page,
                children: [
                  AutoRoute(
                    initial: true,
                    page: ArticleListRoute.page,
                    path: 'search',
                  ),
                  AutoRoute(
                    page: ArticleRoute.page,
                    path: 'search/article',
                  ),
                ]
              ),
              AutoRoute(
                page: SettingsRoute.page,
                path: 'settings'
              ),
        ]),
      ];
}
