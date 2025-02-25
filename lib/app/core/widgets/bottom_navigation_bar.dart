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
    final String location = GoRouter.of(context).state!.uri.toString();
    final int currentIndex = AppRoutes.indexes[location] ?? 0;

    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        currentIndex: currentIndex,
        onTap: (index) {
          handleNavigate(context, index);
        },
        items: [
          BottomNavigationBarItem(
            icon: MyNavBarIcon(
                icon: Icons.home_outlined, isFocused: currentIndex == 0),
            label: AppRoutes.titleHome,
          ),
          BottomNavigationBarItem(
            icon: MyNavBarIcon(
                icon: Icons.search_outlined, isFocused: currentIndex == 1),
            label: AppRoutes.titleSearch,
          ),
          BottomNavigationBarItem(
              icon: MyNavBarIcon(
                  icon: Icons.playlist_play_outlined,
                  isFocused: currentIndex == 2),
              label: AppRoutes.titlePlaylist),
          BottomNavigationBarItem(
              icon: MyNavBarIcon(
                  icon: Icons.settings_outlined, isFocused: currentIndex == 3),
              label: AppRoutes.titleSettings),
        ]);
  }
}

class MyNavBarIcon extends StatefulWidget {
  final IconData icon;
  final bool isFocused;

  const MyNavBarIcon({super.key, required this.isFocused, required this.icon});

  @override
  State<MyNavBarIcon> createState() => _MyNavBarIconState();
}

class _MyNavBarIconState extends State<MyNavBarIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 450));
    _scaleAnimation = Tween<double>(begin: 0.9, end: 1.25).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
    );

    if (widget.isFocused) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(MyNavBarIcon oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isFocused) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (ctx, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Icon(widget.icon),
          );
        });
  }
}
