import 'package:flutter/material.dart';
import 'package:q_less_campus/navigation_hub.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _stayLoggedIn = false; // Required 3rd field type

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Slide 5: The base structure
      backgroundColor: Colors.grey[100], // Soft background for contrast
      body: SingleChildScrollView(
        // Essential for responsiveness
        child: Column(
          // Slide 62: Vertical layout
          children: [
            // PART 1: BEAUTIFUL HEADER (Gradient + Curves)
            Container(
              // Slide 15: Styling & Decoration
              height: 300,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  // High-mark creative design
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFBE361D),
                    Color(0xFFE55A40),
                  ], // Sinopia Gradient
                ),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(
                    100,
                  ), // Slide 18: Rounded corners
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.only(left: 30, top: 120),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Q-Less", // Slide 21: Text Widget
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Campus Dining Redefined",
                      style: TextStyle(fontSize: 18, color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ),

            // PART 2: THE LOGIN FORM
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    "Hello Again!",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 40),

                  // FIELD 1: TEXT ENTRY (Student ID)
                  const TextField(
                    decoration: InputDecoration(
                      labelText: "Student ID",
                      prefixIcon: Icon(Icons.badge_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // FIELD 2: OBSCURED ENTRY (Password)
                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      prefixIcon: Icon(Icons.lock_outline),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                  ),

                  // FIELD 3: SWITCH (Required field variety)
                  const SizedBox(height: 10),
                  SwitchListTile(
                    title: const Text("Keep me signed in"),
                    value: _stayLoggedIn,
                    activeColor: const Color(0xFFBE361D),
                    onChanged: (bool value) {
                      setState(() {
                        _stayLoggedIn = value;
                      });
                    },
                  ),

                  // PART 3: ACTION BUTTON
                  const SizedBox(height: 30),
                  ElevatedButton(
                    // Slide 14: Button Widget
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(
                        0xFFBE361D,
                      ), // Sinopia brand color
                      minimumSize: const Size(double.infinity, 55),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      // Navigator logic to enter the app
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NavigationHub(),
                        ),
                      );
                    },
                    child: const Text(
                      "Sign In",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),

                  const SizedBox(height: 20),
                  const Center(
                    child: Text("Problem Logging In? Contact Admin"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
