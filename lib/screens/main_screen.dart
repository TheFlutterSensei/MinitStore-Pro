import 'package:flutter/material.dart';
import 'package:ministore_pro/data/products.dart';
import 'package:ministore_pro/screens/cart_screen.dart';
import 'package:ministore_pro/screens/help_screen.dart';
import 'package:ministore_pro/screens/home_screen.dart';
import 'package:ministore_pro/screens/profile_screen.dart';
import 'package:ministore_pro/screens/settings_screen.dart';
import 'package:ministore_pro/models/product.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedScreen = 0;
  final Map<Product, int> _cart = {};

  void _addToCart(Product product) {
    setState(() {
      _cart.update(product, (quantity) => quantity + 1, ifAbsent: () => 1);
    });
  }

  final List<Widget> _screens = [
    const HomeScreen(),
    const CartScreen(),
    const ProfileScreen(),
    const SettingsScreen(),
    const HelpScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(index: _selectedScreen, children: _screens),
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        indicatorColor: Colors.blue.shade100,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        selectedIndex: _selectedScreen,
        onDestinationSelected: (index) {
          setState(() {
            _selectedScreen = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart_outlined),
            selectedIcon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: 'Settings',
          ),
          NavigationDestination(
            icon: Icon(Icons.help_outline),
            selectedIcon: Icon(Icons.help),
            label: 'Help',
          ),
        ],
      ),
    );
  }
}
