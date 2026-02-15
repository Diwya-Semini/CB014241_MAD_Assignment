import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;
    final Color orange = theme.colorScheme.primary;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Student Profile",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      // LayoutBuilder ensures no overflow and handles iPad/Landscape views
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            // LANDSCAPE / IPAD VIEW: Two-Pane Split
            return Row(
              children: [
                Expanded(flex: 2, child: _buildProfileHeader(orange)),
                const VerticalDivider(width: 1),
                Expanded(flex: 3, child: _buildSettingsList(isDark)),
              ],
            );
          } else {
            // PORTRAIT VIEW: Single Column
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

  // --- 1. PROFILE HEADER: Appropriate Student Content ---
  Widget _buildProfileHeader(Color orange) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: orange.withValues(alpha: 0.1),
            child: Icon(Icons.person, size: 50, color: orange),
          ),
          const SizedBox(height: 15),
          const Text(
            "Diwya Semini Jayawardana", // Real student data
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Text(
            "Software Engineering Student", // Relevant role
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  // --- 2. SETTINGS LIST: Minimalist and Functional ---
  Widget _buildSettingsList(bool isDark) {
    return Padding(
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

  Widget _buildProfileTile(
    IconData icon,
    String title,
    String subtitle, {
    bool isDestructive = false,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 0, // Keeps it minimalist
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Icon(icon, color: isDestructive ? Colors.red : Colors.black87),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isDestructive ? Colors.red : Colors.black87,
          ),
        ),
        subtitle: Text(subtitle, style: const TextStyle(fontSize: 12)),
        trailing: const Icon(Icons.chevron_right, size: 20),
        onTap: () {},
      ),
    );
  }
}
