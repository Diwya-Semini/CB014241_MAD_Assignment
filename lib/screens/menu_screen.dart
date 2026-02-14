import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    const Color brandNavy = Color(0xFF050D2E);

    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            // LEFT SIDE: Menu List (60% of the screen width)
            Expanded(
              flex: 3,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Search Bar
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Search your food",
                        prefixIcon: const Icon(Icons.search),
                        filled: true,
                        fillColor: isDark ? Colors.white.withValues(alpha: 0.1) : const Color(0xFFF5F5F5),
                        border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text("Explore Category", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    // Categories Row
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _buildCategory(Icons.grid_view_rounded, "All", brandNavy, true),
                          _buildCategory(Icons.restaurant, "Main", Colors.orange, false),
                          _buildCategory(Icons.cake, "Pastry", Colors.brown, false),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Food Grid (Adjusted for landscape space)
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1.1, // Wider cards for landscape
                      children: [
                        _buildFoodCard("Rice and Curry", "Rs. 650.00", "https://images.unsplash.com/photo-1542367592-8849f530cd9a?q=80&w=500", isDark, brandNavy),
                        _buildFoodCard("Fired Rice", "Rs. 650.00", "https://images.unsplash.com/photo-1603133872878-684f208fb84b?q=80&w=500", isDark, brandNavy),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // RIGHT SIDE: Food Detail Panel (40% of the screen width)
            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.all(15),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: isDark ? Colors.white.withValues(alpha: 0.05) : const Color(0xFFF9F9F9),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Profile Header
                    Row(
                      children: [
                        const CircleAvatar(radius: 20, backgroundImage: NetworkImage('https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=200')),
                        const SizedBox(width: 10),
                        Text("Hello Diwya", style: TextStyle(fontWeight: FontWeight.bold, color: isDark ? Colors.white : brandNavy)),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Large Preview Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network("https://images.unsplash.com/photo-1603133872878-684f208fb84b?q=80&w=500", height: 150, width: double.infinity, fit: BoxFit.cover),
                    ),
                    const SizedBox(height: 15),
                    const Text("Fried Rice", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    const Text("Fried Rice with Chili paste, Chicken devil and Vegetable chopsuey", style: TextStyle(color: Colors.grey, fontSize: 13)),
                    const Spacer(),
                    // Add to Cart Button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFBE361D), // Brand Red from mockup
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      ),
                      onPressed: () {},
                      child: const Text("Add to Cart", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Category Builder helper
  Widget _buildCategory(IconData icon, String label, Color color, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: color.withValues(alpha: 0.2), shape: BoxShape.circle),
            child: Icon(icon, color: color, size: 20),
          ),
          Text(label, style: const TextStyle(fontSize: 10)),
        ],
      ),
    );
  }

  // Mini Food Card for Grid
  Widget _buildFoodCard(String name, String price, String url, bool isDark, Color brandNavy) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? Colors.white.withValues(alpha: 0.1) : Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(url, width: 60, height: 60, fit: BoxFit.cover),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12), maxLines: 1),
                Text(price, style: TextStyle(color: brandNavy, fontSize: 11, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}