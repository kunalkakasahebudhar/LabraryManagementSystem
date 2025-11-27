import 'package:flutter/material.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/router/app_router.dart';
import '../../../core/widgets/app_text_field.dart';
import '../../../core/widgets/primary_button.dart';
import '../widgets/auth_background.dart';
import '../widgets/auth_header.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  void _handleSignup() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      if (mounted) {
        setState(() => _isLoading = false);
        // Navigate to OTP verification
        Navigator.pushNamed(context, AppRouter.otpVerify);
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _mobileController.dispose();
    _passwordController.dispose();
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
                title: AppStrings.signupTitle,
                subtitle: "Create your student account",
              ),
              AppTextField(
                label: AppStrings.fullNameLabel,
                controller: _nameController,
                prefixIcon: const Icon(Icons.person_outline_rounded),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppStrings.errorRequired;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              AppTextField(
                label: AppStrings.mobileLabel,
                controller: _mobileController,
                keyboardType: TextInputType.phone,
                prefixIcon: const Icon(Icons.phone_android_rounded),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppStrings.errorRequired;
                  }
                  if (value.length != 10) {
                    return AppStrings.errorInvalidMobile;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              AppTextField(
                label: AppStrings.passwordLabel,
                controller: _passwordController,
                obscureText: true,
                prefixIcon: const Icon(Icons.lock_outline_rounded),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppStrings.errorRequired;
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),
              PrimaryButton(
                text: "Send OTP",
                onPressed: _handleSignup,
                isLoading: _isLoading,
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(AppStrings.loginButton),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
