import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false; // boolean variable to track the state of the "Remember Me" checkbox

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Q-Less Campus',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFFBE361D),
              ),
            ),
            const SizedBox(height: 40),

            // Field 1 - Email
            const TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email_outlined),
                ),
              ),
            const SizedBox(height: 20),

            // Field 2 - Password
            const TextField(
              obscureText: true, // hide the password input
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock_outline),
              ),
            ),
            const SizedBox(height: 10),

            // "Remember Me" checkbox
            SwitchListTile(
              title: const Text('Remember Me'),
              value: _rememberMe,
              activeColor: const Color(0xFFBE361D),
              onChanged: (bool value) {
                setState(() {
                  _rememberMe = value!;
                });
              },
            ),
            const SizedBox(height: 20),

            // Login button
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFBE361D),
                  minimumSize: const Size(double.infinity, 50), // make the button full width
                ),
                onPressed: () {
                  // Logic to handle login action
                },
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                )
            ),

            TextButton(
              onPressed: () {},
              child: const Text("Don't have an account? Contact us!"),)
          ],
        ),
      ),
    );
  }
}
