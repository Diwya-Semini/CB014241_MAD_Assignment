import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;

    // We use the theme primary color (Burnt Orange) for consistency
    final Color brandOrange = theme.colorScheme.primary;

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return _buildLandscapeContent(context, isDark, brandOrange);
        } else {
          return _buildPortraitContent(context, isDark, brandOrange);
        }
      },
    );
  }

  // --- LANDSCAPE CONTENT ---
  Widget _buildLandscapeContent(
    BuildContext context,
    bool isDark,
    Color orange,
  ) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                _buildSearchBar(context, isDark),
                const SizedBox(height: 20),
                _buildCategorySection(orange, isDark),
                const SizedBox(height: 20),
                _buildFoodGrid(context, isDark, orange, isLandscape: true),
              ],
            ),
          ),
        ),
        Expanded(flex: 2, child: _buildDetailPanel(context, isDark, orange)),
      ],
    );
  }

  // --- PORTRAIT CONTENT ---
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
            const SizedBox(height: 20),
            _buildSearchBar(context, isDark),
            const SizedBox(height: 20),
            _buildCategorySection(orange, isDark),
            const SizedBox(height: 20),
            _buildFoodGrid(context, isDark, orange, isLandscape: false),
          ],
        ),
      ),
    );
  }

  // --- COMPONENTS ---

  Widget _buildSearchBar(BuildContext context, bool isDark) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search your food",
        prefixIcon: const Icon(Icons.search),
        filled: true,
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

  Widget _buildHeader(BuildContext context, bool isDark, Color orange) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdylxLhRufslAQAarJ-Hwy_8b3gmBuIk8PAQ&s',
          ),
        ),
        const SizedBox(width: 10),
        Text(
          "Hello Diwya",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : orange,
          ),
        ),
      ],
    );
  }

  Widget _buildCategorySection(Color orange, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Explore Category",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : orange,
          ),
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildCatItem("All", Icons.restaurant_rounded, orange, true),
              _buildCatItem("Main", Icons.rice_bowl, orange, false),
              _buildCatItem(
                "Pastry",
                Icons.bakery_dining_rounded,
                orange,
                false,
              ),
              _buildCatItem("Dessert", Icons.cake, orange, false),
              _buildCatItem("Drink", Icons.local_drink, orange, false),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCatItem(
    String label,
    IconData icon,
    Color color,
    bool selected,
  ) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: color.withValues(alpha: 0.15),
            child: Icon(icon, color: color, size: 25),
          ),
          const SizedBox(height: 5),
          Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildFoodGrid(
    BuildContext context,
    bool isDark,
    Color orange, {
    required bool isLandscape,
  }) {
    final List<Map<String, String>> items = [
      {
        "name": "Rice and Curry",
        "price": "Rs. 650",
        "img":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnSu14EVY4KOJEClUN32DbKla3SS-NvljjcA&s",
        "type": "network",
      },
      {
        "name": "Fried Rice",
        "price": "Rs. 650",
        "img":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRJC8LsN6_37Zy9Hxhh0i6rAedOR1JvMocPA&s",
        "type": "network",
      },
      {
        "name": "Pet Sprite",
        "price": "Rs. 120",
        "img":
            "data:image/jpeg;base64,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",
        "type": "network",
      },
      {
        "name": "Burger",
        "price": "Rs. 180",
        "img":
            "https://i0.wp.com/flaevor.com/wp-content/uploads/2022/04/SambalFriedChickenBurger1.jpg?w=1080&ssl=1",
        "type": "network",
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: isLandscape ? 1.2 : 0.8,
      ),
      itemBuilder: (context, index) => _buildCard(items[index], isDark, orange),
    );
  }

  Widget _buildCard(Map<String, String> item, bool isDark, Color orange) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? Colors.white.withValues(alpha: 0.05) : Colors.white,
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
              child: item['type'] == 'network'
                  ? Image.network(
                      item['img']!,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (c, e, s) => const Icon(Icons.image),
                    )
                  : Image.asset(
                      item['img']!,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (c, e, s) => const Icon(Icons.image),
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['name']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  item['price']!,
                  style: TextStyle(color: orange, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailPanel(BuildContext context, bool isDark, Color orange) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark
            ? Colors.white.withValues(alpha: 0.05)
            : const Color(0xFFF9F9F9),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          _buildHeader(context, isDark, orange),
          const Spacer(),
          const Text(
            "Select an item to view details",
            style: TextStyle(color: Colors.grey),
          ),
          const Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: orange,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            onPressed: () {},
            child: const Text(
              "Add to Cart",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
