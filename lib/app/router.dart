import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:music_player/app/features/home/presentation/home_screen.dart';
import 'package:music_player/app/features/playlist/presentation/playlist_screen.dart';
import 'package:music_player/app/features/search/presentation/search_screen.dart';
import 'package:music_player/app/features/settings/presentation/settings_screen.dart';
import 'package:music_player/app/layout/main_scaffold.dart';

class AppRoutes {
  static const String id = 'id';
  static const String home = '/';
  static const String search = '/search';
  static const String playlist = '/playlist';
  static const String settings = '/settings';

  static const String titleHome = 'Home';
  static const String titleSearch = 'Search';
  static const String titlePlaylist = 'Playlist';
  static const String titleSettings = 'Settings';

  static HashMap<String, int> indexes = HashMap<String, int>.from({
    AppRoutes.home: 0,
    AppRoutes.search: 1,
    AppRoutes.playlist: 2,
    AppRoutes.settings: 3,
  });

  static HashMap<String, String> titles = HashMap<String, String>.from({
    AppRoutes.home: AppRoutes.titleHome,
    AppRoutes.search: AppRoutes.titleSearch,
    AppRoutes.playlist: AppRoutes.titlePlaylist,
    AppRoutes.settings: AppRoutes.titleSettings,
  });
}

class AppRouter {
  final GoRouter router;

  AppRouter()
      : router = GoRouter(initialLocation: AppRoutes.settings, routes: [
          ShellRoute(
              builder: (context, state, child) {
                final url = state.uri.toString();
                final String pageTitle = AppRoutes.titles[url] ?? 'App';
                return MainScaffold(
                  title: pageTitle,
                  child: child,
                );
              },
              routes: [
                GoRoute(
                  path: AppRoutes.home,
                  pageBuilder: (ctx, state) =>
                      AppRouter.customTransitionPage(HomeScreenWidget(), state),
                ),
                GoRoute(
                  path: AppRoutes.search,
                  pageBuilder: (ctx, state) => AppRouter.customTransitionPage(
                      SearchScreenWidget(), state),
                ),
                GoRoute(
                  path: AppRoutes.playlist,
                  pageBuilder: (ctx, state) => AppRouter.customTransitionPage(
                      PlaylistScreenWidget(), state),
                ),
                GoRoute(
                  path: AppRoutes.settings,
                  pageBuilder: (ctx, state) => AppRouter.customTransitionPage(
                      SettingsScreenWidget(), state),
                ),
              ]),
        ]);

  static CustomTransitionPage customTransitionPage(
      Widget page, GoRouterState state) {
    return CustomTransitionPage(
        key: state.pageKey,
        child: page,
        transitionDuration: Durations.medium2,
        transitionsBuilder: (ctx, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;
          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);
          // var fadeAnimation = Tween(begin: 0.0, end: 1.0).animate(animation);
          // return FadeTransition(opacity: fadeAnimation, child: child);
          return SlideTransition(position: offsetAnimation, child: child);
        });
  }
}
