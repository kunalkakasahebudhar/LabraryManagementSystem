import 'package:flutter/material.dart';
import '../../../core/widgets/app_text_field.dart';
import '../../../core/widgets/primary_button.dart';

import '../logic/profile_controller.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _collegeController;
  late TextEditingController _courseController;
  late TextEditingController _addressController;

  @override
  void initState() {
    super.initState();
    final profile = ProfileController().userProfile;
    _nameController = TextEditingController(text: profile.name);
    _emailController = TextEditingController(text: profile.email);
    _collegeController = TextEditingController(text: profile.college);
    _courseController = TextEditingController(text: profile.course);
    _addressController = TextEditingController(text: profile.address);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _collegeController.dispose();
    _courseController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    ProfileController().updateProfile(
      name: _nameController.text,
      email: _emailController.text,
      college: _collegeController.text,
      course: _courseController.text,
      address: _addressController.text,
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profile')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            AppTextField(
              label: 'Full Name',
              hint: 'Kunal Udhar',
              controller: _nameController,
            ),
            const SizedBox(height: 20),
            AppTextField(
              label: 'Email',
              hint: 'kunal@example.com',
              controller: _emailController,
            ),
            const SizedBox(height: 20),
            AppTextField(
              label: 'College',
              hint: 'MIT College',
              controller: _collegeController,
            ),
            const SizedBox(height: 20),
            AppTextField(
              label: 'Course',
              hint: 'B.Tech CS',
              controller: _courseController,
            ),
            const SizedBox(height: 20),
            AppTextField(
              label: 'Address',
              hint: 'Pune, Maharashtra',
              maxLines: 3,
              controller: _addressController,
            ),
            const SizedBox(height: 32),
            PrimaryButton(text: 'Save Changes', onPressed: _saveProfile),
          ],
        ),
      ),
    );
  }
}
