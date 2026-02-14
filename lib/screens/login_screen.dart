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
    // Check current theme to adapt colors accordingly
    final theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 100),
            Center(
              child: Icon(
                Icons.food_bank_outlined,
                size: 80,
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Welcome Back!",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
              ),
            ),
            const Text(
              "Sign in to your qless account to continue",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 40),

            // text fields adapting to theme
            _buildTextField("Email", Icons.email_outlined, isDark),
            const SizedBox(height: 20),
            _buildTextField(
              "Password",
              Icons.lock_outline_rounded,
              isDark,
              obscure: true,
            ),

            // remember me switch using the primary col
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text("Remember me", style: TextStyle(fontSize: 14)),
              value: _stayLoggedIn,
              activeColor: theme.colorScheme.primary,
              onChanged: (val) => setState(() => _stayLoggedIn = val),
            ),

            const SizedBox(height: 30),
            // sign in button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.primary,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 0,
              ),
              onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const NavigationHub()),
              ),
              child: const Text(
                "Sign In",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to keep the code short and clean
  Widget _buildTextField(
    String label,
    IconData icon,
    bool isDark, {
    bool obscure = false,
  }) {
    return TextField(
      obscureText: obscure,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        filled: true,
        // Using Light Black in dark mode to avoid any blue tints
        fillColor: isDark
            ? Colors.white.withValues(alpha: 0.1)
            : const Color(0xFFF5F5F5),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
