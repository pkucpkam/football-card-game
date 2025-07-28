// lib/widgets/common/curved_bottom_nav_bar.dart

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class CurvedBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CurvedBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      index: currentIndex,
      height: 60.0,
      items: const [
        Icon(Icons.store, size: 30),
        Icon(Icons.inventory_2, size: 30),
        Icon(Icons.home, size: 30),
        Icon(Icons.sports_soccer, size: 30),
        Icon(Icons.notifications, size: 30),
      ],
      color: Colors.white,
      buttonBackgroundColor: const Color.fromARGB(255, 81, 162, 234),
      backgroundColor: Colors.transparent,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      onTap: onTap,
    );
  }
}
