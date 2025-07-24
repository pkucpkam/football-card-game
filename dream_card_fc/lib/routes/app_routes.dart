import 'package:dream_card_fc/screens/checkin_screen.dart';
import 'package:dream_card_fc/screens/mission_screen.dart';
import 'package:dream_card_fc/temp/packs_screen.dart';
import 'package:dream_card_fc/screens/pitch_screen.dart';
import 'package:dream_card_fc/screens/ranking_screen.dart';
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
    '/profile': (context) => const ProfileScreen(),
    '/notifications': (context) => const NotificationsScreen(),
    '/ranking': (context) => const LeaderboardScreen(),
    '/checkin': (context) => const CheckInScreen(),
    '/missions': (context) => const MissionsScreen(),
    '/pitch': (context) => const PitchScreen(),
  };
}
