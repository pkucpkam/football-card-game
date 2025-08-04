import 'package:dream_card_fc/widgets/common/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'market_screen.dart';
import 'players_screen.dart';
import 'packs_screen.dart';
import 'items_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 2;

  final List<Widget> _screens = const [
    MarketScreen(),
    PacksScreen(),
    HomeScreen(),
    PlayersScreen(),
    ItemsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: CurvedBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
