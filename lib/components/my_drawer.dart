import 'package:flutter/material.dart';
import 'package:food/components/my_drawer_tile.dart';
import 'package:food/services/auth/auth_services.dart';

import '../pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    final authService = AuthService();
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 248, 115, 43), // Set the drawer background to orange
      child: Column(
        children: [
          // App logo (food-related icon)
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Icon(
              Icons.fastfood, // Replaced the lock icon with a food-related icon
              size: 80,
              color: Colors.white, // White color for the icon to contrast the orange background
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary, // Divider color to complement the theme
            ),
          ),
          
          // Home list title
          MyDrawerTile(
            text: "H O M E",
            icon: Icons.home,
            onTap: () => Navigator.pop(context),
          ),

          // Settings list title
          MyDrawerTile(
            text: "S E T T I N G S",
            icon: Icons.settings,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
          ),

          const Spacer(),

          // Logout list title
          MyDrawerTile(
            text: "L O G O U T",
            icon: Icons.logout,
            onTap: () {
              logout();
              Navigator.pop(context);
            },
          ),

          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
