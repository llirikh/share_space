import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:news/theme/theme_provider.dart';
import 'package:provider/provider.dart';

@RoutePage()
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({
    super.key,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          pinned: false,
          snap: true,
          floating: true,
          forceElevated: true,
          elevation: 0,
          shadowColor: theme.shadowColor.withOpacity(0.2),
          surfaceTintColor: Colors.transparent,
          titleTextStyle:  TextStyle(
            color: theme.colorScheme.inverseSurface,
            fontWeight: FontWeight.w600,
            fontSize: 26,
            letterSpacing: 0.8
          ),
          title: const Center( child: Text("Settings")),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
          height: 12,
          )
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            width: double.infinity,
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: theme.shadowColor.withOpacity(0.1),
                  blurRadius: 7,
                )
              ]
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Dark theme",
                  style: theme.textTheme.titleMedium?.copyWith(fontSize: 18),
                ),
                Switch(
                  value: Provider.of<ThemeProvider>(context).isDarkMode(),
                  onChanged: (value) {
                    setState(() {
                      Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
                    });
                  },
                  activeColor: theme.primaryColor.withOpacity(1),
                  activeTrackColor: theme.primaryColor.withOpacity(0.2),
                  inactiveThumbColor: theme.hintColor.withOpacity(0.6),
                  inactiveTrackColor: theme.hintColor.withOpacity(0.1),
                  trackOutlineColor: const MaterialStatePropertyAll(Colors.transparent),
                )
              ],
            )
          )
        )
      ]
    );
  }
}