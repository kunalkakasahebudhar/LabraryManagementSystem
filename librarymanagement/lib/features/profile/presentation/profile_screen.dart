import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/router/app_router.dart';
import '../../../core/widgets/primary_button.dart';
import '../widgets/profile_header.dart';
import '../logic/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ProfileController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, AppRouter.settings),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          final profile = controller.userProfile;
          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                ProfileHeader(userProfile: profile),
                const SizedBox(height: 32),
                _buildInfoTile(Icons.email_outlined, 'Email', profile.email),
                _buildInfoTile(
                  Icons.school_outlined,
                  'College',
                  profile.college,
                ),
                _buildInfoTile(Icons.book_outlined, 'Course', profile.course),
                _buildInfoTile(
                  Icons.location_on_outlined,
                  'Address',
                  profile.address,
                ),
                const SizedBox(height: 32),
                PrimaryButton(
                  text: 'Edit Profile',
                  onPressed: () =>
                      Navigator.pushNamed(context, AppRouter.editProfile),
                  isOutlined: true,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildInfoTile(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.05),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: AppColors.primary, size: 20),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
