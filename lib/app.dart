import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_meet/providers/bottom_nav_provider.dart';
import 'package:page_meet/screens/board_screen.dart';
import 'package:page_meet/screens/home_screen.dart';
import 'package:page_meet/screens/library_screen.dart';
import 'package:page_meet/screens/profile_screen.dart';
import 'package:page_meet/theme/colors.dart';

class PageMeetApp extends ConsumerWidget {
  PageMeetApp({super.key});

  final List<Widget> _screens = [
    HomeScreen(),
    BoardScreen(),
    LibraryScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIdx = ref.watch(bottomNavIndexProvider);

    return Scaffold(
      body: _screens[currentIdx],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.primary,
        backgroundColor: AppColors.bottomBackground,
        unselectedItemColor: AppColors.accent.withValues(alpha: 0.6),
        currentIndex: currentIdx,
        onTap: (idx) => ref.read(bottomNavIndexProvider.notifier).state = idx,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.forum),
            label: 'Board',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Library',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
