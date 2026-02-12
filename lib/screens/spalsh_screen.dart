import 'dart:async';
import 'package:flutter/material.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // LIFECYCLE: initState runs once when the app starts.
  @override
  void initState() {
    super.initState();

    // TIMER: Creates a 3-second delay to show the brand identity.
    Timer(const Duration(seconds: 3), () {
      // NAVIGATION: Replaces the splash screen so the user can't go 'back' to it.
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // BRANDING: Using the new Teal (#2596BE) for a professional look.
      backgroundColor: Color(0xFF0B1540),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ICON: Using white here for high contrast against the teal background.
            Icon(Icons.restaurant_rounded, size: 80, color: Colors.white),
            SizedBox(height: 20),

            Text(
              "Q-LESS",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 2.5,
              ),
            ),
            SizedBox(height: 30),

            // DYNAMIC ELEMENT: Shows the user the app is initializing.
            CircularProgressIndicator(color: Colors.white),
          ],
        ),
      ),
    );
  }
}
