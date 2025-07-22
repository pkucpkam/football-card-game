import 'package:dream_card_fc/screens/packs.dart';
import 'package:flutter/material.dart';
import '../screens/login_screen.dart';
import '../screens/register_screen.dart';
import '../screens/home_screen.dart';
import '../screens/players_screen.dart';
import '../screens/market_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/notifications_screen.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    '/login': (context) => LoginScreen(),
    '/register': (context) => RegisterScreen(),
    '/home': (context) => HomeScreen(),
    '/packs': (context) => PacksScreen(),
    '/market': (context) => const MarketScreen(),
    '/players': (context) => const PlayersScreen(),
    '/profile': (context) => const NotificationsScreen(),
  };
}
