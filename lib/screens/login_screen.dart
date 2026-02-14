import 'package:flutter/material.dart';
import 'package:q_less_campus/navigation_hub.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _stayLoggedIn = false; // track remind me toggle

  @override
  Widget build(BuildContext context) {
    final Color adaptiveColor = Theme.of(
      context,
    ).colorScheme.primary; // change colors of icons and text based on theme
    final bool isDark =
        Theme.of(context).brightness ==
        Brightness
            .dark; // Check if current theme is dark for change colors of input fields and buttons

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 100),
              Center(
                child: Icon(
                  Icons.food_bank_outlined,
                  size: 100,
                  color: adaptiveColor,
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "Welcome Back!",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: adaptiveColor,
                ),
              ),
              const Text(
                "Sign in to your qless account to continue",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 40),

              // input field - Email
              TextField(
                decoration: InputDecoration(
                  labelText: "Email",
                  prefixIcon: const Icon(Icons.email_outlined),
                  filled: true,
                  fillColor: isDark ? Colors.white10 : const Color(0xFFF5F5F5),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: const Icon(Icons.lock_outline_rounded),
                  filled: true,
                  fillColor: isDark ? Colors.white10 : const Color(0xFFF5F5F5),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),

              // remember me toggle
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text(
                  "Remember me",
                  style: TextStyle(fontSize: 14),
                ),
                value: _stayLoggedIn,
                activeColor: adaptiveColor,
                onChanged: (val) => setState(() => _stayLoggedIn = val),
              ),

              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isDark
                      ? Colors.white
                      : const Color(0xFF050D2E), // White in dark mode
                  foregroundColor: isDark
                      ? const Color(0xFF050D2E)
                      : Colors.white,
                  minimumSize: const Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  elevation: 0,
                ),
                // on press -> navigate to the main navigation hub
                onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NavigationHub(),
                  ),
                ),
                child: const Text(
                  "Sign In",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
