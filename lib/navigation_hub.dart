import 'package:flutter/material.dart';
import 'package:q_less_campus/screens/menu_screen.dart';

class NavigationHub extends StatefulWidget {
  const NavigationHub({super.key});

  @override
  State<NavigationHub> createState() => _NavigationHubState();
}

class _NavigationHubState extends State<NavigationHub> {
  // tracks which tab is currently active.
  // index determines which widget is pulled from the _pages list.
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // system theme check for dynamic coloring
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    // list of screens corresponding to each BottomNavigationBar tab
    final List<Widget> _pages = [
      const MenuScreen(),
      Center(
        child: Text(
          "Cart Screen",
          style: TextStyle(color: isDark ? Colors.white : Colors.black),
        ),
      ),
      Center(
        child: Text(
          "My Orders",
          style: TextStyle(color: isDark ? Colors.white : Colors.black),
        ),
      ),
      Center(
        child: Text(
          "Profile",
          style: TextStyle(color: isDark ? Colors.white : Colors.black),
        ),
      ),
    ];

    return Scaffold(
      // Displays the widget corresponding to the current BottomNavigationBar index
      body: _pages[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        // Updates the screen when a new tab is tapped
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },

        type: BottomNavigationBarType.fixed,

        // Adaptive Color
        selectedItemColor: Theme.of(context).colorScheme.primary,

        // Sets unselected icons to a visible
        unselectedItemColor: isDark ? Colors.white60 : Colors.black45,

        // Respects the Black or White background of the theme
        backgroundColor: isDark ? const Color(0xFF121212) : Colors.white,

        // screen navigation
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
