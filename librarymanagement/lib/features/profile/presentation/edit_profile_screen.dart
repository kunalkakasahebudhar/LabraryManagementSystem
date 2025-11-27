import 'package:flutter/material.dart';
import '../../../core/widgets/app_text_field.dart';
import '../../../core/widgets/primary_button.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profile')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const AppTextField(label: 'Full Name', hint: 'Kunal Udhar'),
            const SizedBox(height: 20),
            const AppTextField(label: 'Email', hint: 'kunal@example.com'),
            const SizedBox(height: 20),
            const AppTextField(label: 'College', hint: 'MIT College'),
            const SizedBox(height: 20),
            const AppTextField(label: 'Course', hint: 'B.Tech CS'),
            const SizedBox(height: 20),
            const AppTextField(
              label: 'Address',
              hint: 'Pune, Maharashtra',
              maxLines: 3,
            ),
            const SizedBox(height: 32),
            PrimaryButton(
              text: 'Save Changes',
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
