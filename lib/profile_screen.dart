
import 'package:flutter/material.dart';
import 'main.dart' show orange, LoginScreen;

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Profile')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SizedBox(height: 20),
          const CircleAvatar(
            radius: 50,
            backgroundColor: Color(0xFFFFE8D9),
            child: Icon(
              Icons.person,
              size: 60,
              color: orange,
            ),
          ),
          const SizedBox(height: 15),
          const Center(
            child: Text(
              'My Account',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Center(child: Text('Welcome to your profile')),
          const SizedBox(height: 30),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(
                    Icons.shopping_bag_outlined,
                    color: orange,
                  ),
                  title: const Text('My Orders'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => _showMessage(
                    context,
                    'Order history coming soon',
                  ),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(
                    Icons.location_on_outlined,
                    color: orange,
                  ),
                  title: const Text('Saved Addresses'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => _showMessage(
                    context,
                    'Address management coming soon',
                  ),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(
                    Icons.settings_outlined,
                    color: orange,
                  ),
                  title: const Text('Account Settings'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => _showMessage(
                    context,
                    'Settings coming soon',
                  ),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(
                    Icons.logout,
                    color: orange,
                  ),
                  title: const Text('Logout'),
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const LoginScreen(),
                      ),
                          (route) => false,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
