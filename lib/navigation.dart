import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation>{
  int _CurrentIndex = 0;

  final List<Widget> _pages = [
    // const MenuScreen(),
    // const CaretScreen(),
    // const OrdersScreen(),
    // const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_CurrentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _CurrentIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _CurrentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.menu), label: 'Menu'),
          NavigationDestination(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          NavigationDestination(icon: Icon(Icons.receipt_long), label: 'Orders'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ]
      ),
    );
  }
}