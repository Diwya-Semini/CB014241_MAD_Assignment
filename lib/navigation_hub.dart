import 'package:flutter/material.dart';

class NavigationHub extends StatefulWidget {
  const NavigationHub({super.key});

  @override
  State<NavigationHub> createState() => _NavigationHubState();
}

class _NavigationHubState extends State<NavigationHub> {
  // STATE: Tracks which screen is currently visible.
  int _currentIndex = 0;

  // SCREENS: The main areas of your student canteen app.
  final List<Widget> _pages = [
    const Center(
      child: Text("Menu Screen", style: TextStyle(color: Colors.black)),
    ),
    const Center(
      child: Text("Cart Screen", style: TextStyle(color: Colors.black)),
    ),
    const Center(
      child: Text("My Orders", style: TextStyle(color: Colors.black)),
    ),
    const Center(
      child: Text("Profile", style: TextStyle(color: Colors.black)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // Updates dynamically based on selection.

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,

        // INTERACTION: Updates the UI state when a student taps a tab.
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Triggers a rebuild of the body.
          });
        },

        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(
          0xFF0B1540,
        ), // ACTIVE COLOR: Your new teal.
        unselectedItemColor: Colors.black45, // INACTIVE COLOR: Soft black/grey.

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
