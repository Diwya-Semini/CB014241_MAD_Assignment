import 'package:flutter/material.dart';
import 'package:q_less_campus/navigation_hub.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _stayLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    final Color adaptiveColor = Theme.of(context).colorScheme.primary;
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

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
                  Icons.login_outlined,
                  size: 80,
                  color: adaptiveColor,
                ),
              ),
              const SizedBox(height: 40),
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

              // INPUT FIELDS: Rounded and subtle
              TextField(
                decoration: InputDecoration(
                  labelText: "Student ID",
                  prefixIcon: const Icon(Icons.badge_outlined),
                  filled: true,
                  fillColor: isDark ? Colors.white10 : const Color(0xFFF5F5F5),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: const Icon(Icons.lock_outline),
                  filled: true,
                  fillColor: isDark ? Colors.white10 : const Color(0xFFF5F5F5),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),

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
                      : const Color(
                          0xFF050D2E,
                        ), // White in dark mode for visibility
                  foregroundColor: isDark
                      ? const Color(0xFF050D2E)
                      : Colors.white,
                  minimumSize: const Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 0,
                ),
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
