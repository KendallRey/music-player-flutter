import 'package:flutter/material.dart';
import 'package:music_player/app/core/widgets/app_bar.dart';
import 'package:music_player/app/core/widgets/bottom_navigation_bar.dart';

class MainScaffold extends StatelessWidget {
  final String title;
  final Widget child;

  const MainScaffold({super.key, required this.child, required this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: title),
      body: AnimatedSwitcher(
        duration: Durations.short1,
        child: child,
      ),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}
