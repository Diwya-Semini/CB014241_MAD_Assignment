import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // theme and color setup
    final theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;
    final Color orange = theme.colorScheme.primary;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDark
            ? const Color.fromARGB(255, 30, 30, 30)
            : Colors.white,
        title: const Text(
          "Student Profile",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      // LayoutBuilder for no overflow
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            // landscape - two splits
            return Row(
              children: [
                Expanded(flex: 2, child: _buildProfileHeader(orange)),
                const VerticalDivider(width: 1),
                Expanded(flex: 3, child: _buildSettingsList(isDark)),
              ],
            );
          } else {
            // potrait - single scroll view
            return SingleChildScrollView(
              child: Column(
                children: [
                  _buildProfileHeader(orange),
                  _buildSettingsList(isDark),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  // profile header with avatar and name
  Widget _buildProfileHeader(Color orange) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdylxLhRufslAQAarJ-Hwy_8b3gmBuIk8PAQ&s",
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            "Diwya Semini Jayawardana", // Real student data
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Text(
            "APIIT - Union Place Main Canteen", // Relevant role
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  // settings list
  Widget _buildSettingsList(bool isDark) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          _buildProfileTile(
            Icons.shopping_bag_outlined,
            "Order History",
            "Track your current meals",
          ),
          _buildProfileTile(
            Icons.notifications_none,
            "Notifications",
            "Pickup alerts and news",
          ),
          _buildProfileTile(
            Icons.info_outline,
            "About Q-Less",
            "Version 1.0.0 (Beta)",
          ),
          _buildProfileTile(
            Icons.logout,
            "Logout",
            "Exit the application",
            isDestructive: true,
          ),
        ],
      ),
    );
  }

  // combined profile header and settings list for landscape mode
  Widget _buildProfileTile(
    IconData icon,
    String title,
    String subtitle, {
    bool isDestructive = false,
  }) {
    // logout tile with red color
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Icon(
          icon,
          color: isDestructive
              ? Colors.red
              : const Color.fromARGB(221, 215, 63, 2),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isDestructive
                ? Colors.red
                : const Color.fromARGB(221, 215, 63, 2),
          ),
        ),
        subtitle: Text(subtitle, style: const TextStyle(fontSize: 12)),
        trailing: const Icon(Icons.chevron_right, size: 20),
        onTap: () {},
      ),
    );
  }
}
