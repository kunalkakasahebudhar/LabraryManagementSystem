import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/router/app_router.dart';
import '../../../core/widgets/app_text_field.dart';
import '../../../core/widgets/primary_button.dart';
import '../widgets/auth_background.dart';
import '../widgets/auth_header.dart';

class FirstTimeProfileSetupScreen extends StatefulWidget {
  const FirstTimeProfileSetupScreen({super.key});

  @override
  State<FirstTimeProfileSetupScreen> createState() =>
      _FirstTimeProfileSetupScreenState();
}

class _FirstTimeProfileSetupScreenState
    extends State<FirstTimeProfileSetupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _collegeController = TextEditingController();
  final _courseController = TextEditingController();
  final _emailController = TextEditingController();
  bool _isLoading = false;

  void _handleCompleteSetup() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      if (mounted) {
        setState(() => _isLoading = false);
        Navigator.pushReplacementNamed(context, AppRouter.dashboard);
      }
    }
  }

  @override
  void dispose() {
    _collegeController.dispose();
    _courseController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthBackground(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AuthHeader(
                title: "Complete Profile",
                subtitle: "Tell us a bit more about yourself",
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 4),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              AppTextField(
                label: AppStrings.emailLabel,
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: const Icon(Icons.email_outlined),
              ),
              const SizedBox(height: 20),
              AppTextField(
                label: "College / Institute",
                controller: _collegeController,
                prefixIcon: const Icon(Icons.school_outlined),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppStrings.errorRequired;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              AppTextField(
                label: "Class / Course",
                controller: _courseController,
                prefixIcon: const Icon(Icons.book_outlined),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppStrings.errorRequired;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 40),
              PrimaryButton(
                text: "Complete Setup",
                onPressed: _handleCompleteSetup,
                isLoading: _isLoading,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
