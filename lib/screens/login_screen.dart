import 'package:flutter/material.dart';
import 'package:q_less_campus/navigation_hub.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // STATE MANAGEMENT: Tracks the 'Remember me' switch.
  // Explain in Viva: This triggers a UI rebuild via setState.
  bool _stayLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA), // MINIMALISM: Soft background.
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 100),

              // BRANDING ACCENT: Using the new Teal color (#2596be).
              const Center(
                child: Icon(
                  Icons.restaurant_rounded,
                  size: 60,
                  color: Color(0xFF0B1540),
                ),
              ),
              const SizedBox(height: 40),

              // TYPOGRAPHY: Black text for high contrast.
              const Text(
                "Hello There 👋",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const Text(
                "Sign in to your Q-Less account",
                style: TextStyle(color: Colors.black54),
              ),
              const SizedBox(height: 40),

              // FIELD 1: Student ID
              const TextField(
                style: TextStyle(
                  color: Colors.black,
                ), // Ensures input text is black.
                decoration: InputDecoration(
                  labelText: "Student ID",
                  labelStyle: TextStyle(color: Colors.black54),
                  prefixIcon: Icon(Icons.badge_outlined, color: Colors.black45),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // FIELD 2: Password
              const TextField(
                obscureText: true,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(color: Colors.black54),
                  prefixIcon: Icon(Icons.lock_outline, color: Colors.black45),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                ),
              ),

              const SizedBox(height: 10),
              // FIELD 3: Switch (Variety requirement)
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text(
                  "Remember me",
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
                value: _stayLoggedIn,
                activeColor: const Color(0xFF0B1540), // Updated color.
                onChanged: (val) => setState(() => _stayLoggedIn = val),
              ),

              const SizedBox(height: 30),

              // PRIMARY ACTION: The button with the new #2596be color.
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0B1540),
                  minimumSize: const Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 0,
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NavigationHub(),
                    ),
                  );
                },
                child: const Text(
                  "Sign In",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
