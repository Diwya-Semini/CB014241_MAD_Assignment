import 'package:flutter/material.dart';
import '../models/food_item.dart';
import 'food_detail_screen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  // variable to hold the selected food item
  FoodItem? _selectedFood;

  // food item list
  final List<FoodItem> foodList = [
    FoodItem(
      name: "Rice and Curry",
      price: "Rs. 650",
      img:
          "https://i0.wp.com/theperfectcurry.com/wp-content/uploads/2024/06/PXL_20230530_180945659.PORTRAIT.jpg?resize=768%2C1024&quality=89&ssl=1",
      type: "network",
    ),
    FoodItem(
      name: "Fried Rice",
      price: "Rs. 650",
      img: "https://i.ytimg.com/vi/mgrQD1vum1k/maxresdefault.jpg",
      type: "network",
    ),
    FoodItem(
      name: "Pet Sprite",
      price: "Rs. 120",
      img:
          "https://objectstorage.ap-mumbai-1.oraclecloud.com/n/softlogicbicloud/b/cdn/o/products/100122--01--1592385270.jpeg",
      type: "network",
    ),
    FoodItem(
      name: "Burger",
      price: "Rs. 180",
      img:
          "https://i0.wp.com/flaevor.com/wp-content/uploads/2022/04/SambalFriedChickenBurger1.jpg?resize=1024%2C830&ssl=1",
      type: "network",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // theme and color variables
    final theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;
    final Color brandOrange = theme.colorScheme.primary;

    // responsive layout using LayoutBuilder
    return LayoutBuilder(
      builder: (context, constraints) {
        // _buildPortraitContent to maintain a consistent full screen view
        return _buildPortraitContent(context, isDark, brandOrange);
      },
    );
  }

  // landscape mode
  Widget _buildLandscapeContent(
    BuildContext context,
    bool isDark,
    Color orange,
  ) {
    return _buildPortraitContent(context, isDark, orange);
  }

  // portrait mode
  Widget _buildPortraitContent(
    BuildContext context,
    bool isDark,
    Color orange,
  ) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildHeader(context, isDark, orange),
            const SizedBox(height: 10),
            _buildSearchBar(context, isDark),
            const SizedBox(height: 10),
            _buildCategorySection(orange, isDark),
            const SizedBox(height: 10),
            _buildFoodGrid(context, isDark, orange, isLandscape: false),
          ],
        ),
      ),
    );
  }

  // widgets for different sections of the UI
  // searchbar
  // searchbar
  Widget _buildSearchBar(BuildContext context, bool isDark) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search your food",
        prefixIcon: const Icon(Icons.search, size: 20),
        filled: true,
        isDense: true, // Reduces the height by using less vertical space
        contentPadding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 20,
        ), // Adjusts vertical weight and horizontal padding for a more compact look
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

  // header - Profile picture and greeting
  Widget _buildHeader(BuildContext context, bool isDark, Color orange) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 22,
          backgroundImage: NetworkImage(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdylxLhRufslAQAarJ-Hwy_8b3gmBuIk8PAQ&s',
          ),
        ),
        const SizedBox(width: 10),
        Text(
          "Hello Diwya",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
      ],
    );
  }

  // catgory section with horizontal scroll
  Widget _buildCategorySection(Color orange, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Explore Category",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildCatItem("All", Icons.restaurant_rounded, orange),
              _buildCatItem(
                "Main",
                Icons.rice_bowl,
                const Color.fromARGB(255, 165, 103, 44),
              ),
              _buildCatItem(
                "Pastry",
                Icons.bakery_dining_rounded,
                const Color.fromARGB(255, 165, 103, 44),
              ),
              _buildCatItem(
                "Dessert",
                Icons.cake,
                const Color.fromARGB(255, 165, 103, 44),
              ),
              _buildCatItem(
                "Drink",
                Icons.local_drink,
                const Color.fromARGB(255, 165, 103, 44),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // category item widget
  Widget _buildCatItem(String label, IconData icon, Color color) {
    return Padding(
      // extra right padding for last item to prevent overflow
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: const Color.fromARGB(255, 253, 167, 80),
            child: Icon(icon, color: color, size: 25),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: Color.fromARGB(255, 128, 128, 128),
            ),
          ),
        ],
      ),
    );
  }

  // food grid with 2 columns
  Widget _buildFoodGrid(
    BuildContext context,
    bool isDark,
    Color orange, {
    required bool isLandscape,
  }) {
    return GridView.builder(
      // fixed overflow issue by disabling scroll and wrapping in SingleChildScrollView
      shrinkWrap: true,
      // disable grid's own scrolling
      physics: const NeverScrollableScrollPhysics(),
      itemCount: foodList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: isLandscape ? 1.2 : 0.8,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        final item = foodList[index];
        // on tap show details by navigating to detail screen
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FoodDetailScreen(item: item),
              ),
            );
          },
          child: _buildCard(item, isDark, orange),
        );
      },
    );
  }

  // card widget for each food item in the grid
  Widget _buildCard(FoodItem item, bool isDark, Color orange) {
    return Container(
      decoration: BoxDecoration(
        color: isDark
            ? Colors.white.withValues(alpha: 0.05)
            : const Color.fromARGB(255, 240, 240, 240),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              child: Image.network(
                item.img,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(item.price, style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
