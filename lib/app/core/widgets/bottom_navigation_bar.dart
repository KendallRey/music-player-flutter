import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:music_player/app/router.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({super.key});

  void handleNavigate(BuildContext ctx, int index) {
    if (ctx.mounted) {
      switch (index) {
        case 0:
          ctx.go(AppRoutes.home);
          break;
        case 1:
          ctx.go(AppRoutes.search);
          break;
        case 2:
          ctx.go(AppRoutes.playlist);
          break;
        case 3:
          ctx.go(AppRoutes.settings);
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: (index) {
          handleNavigate(context, index);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: AppRoutes.titleHome,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search_outlined,
            ),
            label: AppRoutes.titleSearch,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.playlist_play_outlined),
              label: AppRoutes.titleSettings),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: AppRoutes.titleSettings),
        ]);
  }
}
