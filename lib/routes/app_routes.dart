import 'package:flutter/cupertino.dart';
import 'package:ministore_pro/screens/help_screen.dart';
import 'package:ministore_pro/screens/main_screen.dart';
import 'package:ministore_pro/screens/profile_screen.dart';
import 'package:ministore_pro/screens/settings_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String cart = '/cart';
  static const String profile = '/profile';
  static const String settings = '/settings';
  static const String help = '/help';

  static final Map<String, WidgetBuilder> routes = {
    home: (context) => const MainScreen(),
    profile: (context) => const ProfileScreen(),
    settings: (context) => const SettingsScreen(),
    help: (context) => const HelpScreen(),
  };
}
