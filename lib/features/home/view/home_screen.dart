import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../router/router.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: AutoTabsRouter(
          routes: const [
            SearchRoute(),
            SettingsRoute(),
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
    tabsRouter.setActiveIndex(index);
  }
}
