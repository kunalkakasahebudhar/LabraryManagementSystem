import 'package:flutter/material.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/router/app_router.dart';
import '../../../core/widgets/app_text_field.dart';
import '../../../core/widgets/primary_button.dart';
import '../widgets/auth_background.dart';
import '../widgets/auth_header.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _mobileController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  void _handleLogin() async {
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
                title: AppStrings.loginTitle,
                subtitle: AppStrings.loginSubtitle,
              ),
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
                  return null;
                },
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRouter.forgotPassword);
                  },
                  child: const Text(AppStrings.forgotPassword),
                ),
              ),
              const SizedBox(height: 32),
              PrimaryButton(
                text: AppStrings.loginButton,
                onPressed: _handleLogin,
                isLoading: _isLoading,
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRouter.signup);
                    },
                    child: const Text(AppStrings.createAccount),
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
