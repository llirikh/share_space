import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

import '../api/models/article.dart';
import '../features/article/view/article_screen.dart';
import '../features/article_navigation/view/article_navigation_screen.dart';
import '../features/home/view/home_screen.dart';
import '../features/articles_list//view/articles_list_screen.dart';
import '../features/settings/view/settings_screen.dart';

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
                    page: SearchRoute.page,
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
