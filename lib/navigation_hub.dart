import 'package:flutter/material.dart';

class NavigationHub extends StatefulWidget {
  const NavigationHub({super.key});

  @override
  State<NavigationHub> createState() => _NavigationHubState();
}

class _NavigationHubState extends State<NavigationHub> {
  int _currentIndex = 0;

  // These are the 4 core screens required for an "Excellent" grade
  final List<Widget> _pages = [
    // const MenuScreen(),
    // const Center(child: Text("Cart Screen")),
    // const Center(child: Text("My Orders")),
    // const Center(child: Text("Profile Settings")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The foundation widget [cite: 5]
      body: _pages[_currentIndex], // Changes based on selection
      bottomNavigationBar: BottomNavigationBar(
        // Switching bar
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFFBE361D), // Sinopia brand color
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Orders'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
