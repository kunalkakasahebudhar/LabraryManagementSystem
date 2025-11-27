import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/router/app_router.dart';
import '../widgets/settings_tile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SettingsTile(
              title: 'Language',
              icon: Icons.language,
              trailing: const Text(
                'English',
                style: TextStyle(color: Colors.grey),
              ),
              onTap: () {},
            ),
            const Divider(),
            SettingsTile(
              title: 'Dark Mode',
              icon: Icons.dark_mode_outlined,
              trailing: Switch(value: false, onChanged: (val) {}),
            ),
            const Divider(),
            SettingsTile(
              title: 'Notifications',
              icon: Icons.notifications_outlined,
              trailing: Switch(value: true, onChanged: (val) {}),
            ),
            const Divider(),
            SettingsTile(
              title: 'Privacy Policy',
              icon: Icons.privacy_tip_outlined,
              onTap: () {},
            ),
            const Divider(),
            SettingsTile(
              title: 'Terms & Conditions',
              icon: Icons.description_outlined,
              onTap: () {},
            ),
            const SizedBox(height: 40),
            TextButton(
              onPressed: () {
                // Show logout dialog
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Logout'),
                    content: const Text('Are you sure you want to logout?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            AppRouter.login,
                            (route) => false,
                          );
                        },
                        child: const Text(
                          'Logout',
                          style: TextStyle(color: AppColors.error),
                        ),
                      ),
                    ],
                  ),
                );
              },
              child: const Text(
                'Logout',
                style: TextStyle(color: AppColors.error, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
