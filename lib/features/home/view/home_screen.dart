import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../router/router.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _controllerArticleListScreen;

  void _scrollToBeginning() {
    var distance = ((_controllerArticleListScreen.position.pixels - _controllerArticleListScreen.position.minScrollExtent) / 10).round();
    _controllerArticleListScreen.animateTo(
        _controllerArticleListScreen.position.minScrollExtent,
        duration: Duration(milliseconds: min(distance, 600)),
        curve: Curves.easeInOut
    );
  }

  @override
  void initState() {
    super.initState();
    _controllerArticleListScreen = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: AutoTabsRouter(
        routes: [
            ArticleListRoute(controller: _controllerArticleListScreen),
            const SettingsRoute(),
          ],
        builder: (context, child) {
            final tabsRouter = AutoTabsRouter.of(context);
            return Scaffold(
              body: child,
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: tabsRouter.activeIndex,
                onTap: (index) => _openPage(index, tabsRouter),
                selectedItemColor: theme.primaryColor,
                selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w400),
                unselectedItemColor: theme.hintColor,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.article),
                      label: "News"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings),
                      label: "Settings")
                ],
              ),
            );
        },
      ),
    );
  }

  void _openPage(int index, TabsRouter tabsRouter) {
    if (tabsRouter.activeIndex == index) {
      if (AutoRouter.of(context).topPage?.name == ArticleListRoute.name) {
        _scrollToBeginning();
      }
    }
    tabsRouter.setActiveIndex(index);
  }
}
