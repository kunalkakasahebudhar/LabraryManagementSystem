import 'package:flutter/material.dart';

import '../../features/splash/presentation/splash_screen.dart';
import '../../features/onboarding/presentation/onboarding_screen.dart';

import '../../features/auth/presentation/login_screen.dart';
import '../../features/auth/presentation/signup_screen.dart';
import '../../features/auth/presentation/otp_verify_screen.dart';
import '../../features/auth/presentation/first_time_profile_setup_screen.dart';
import '../../features/auth/presentation/forgot_password_screen.dart';
import '../../features/dashboard/presentation/dashboard_screen.dart';
import '../../features/plan/presentation/my_plan_screen.dart';

import '../../features/fees/presentation/fees_overview_screen.dart';

import '../../features/attendance/presentation/attendance_screen.dart';

import '../../features/seat_locker/presentation/seat_locker_info_screen.dart';
import '../../features/timings/presentation/timings_holidays_screen.dart';

import '../../features/notices_rules/presentation/notices_screen.dart';
import '../../features/notices_rules/presentation/rules_screen.dart';

import '../../features/support/presentation/support_screen.dart';
import '../../features/profile/presentation/profile_screen.dart';
import '../../features/profile/presentation/edit_profile_screen.dart';
import '../../features/settings/presentation/settings_screen.dart';
import '../../features/reminders/presentation/reminders_screen.dart';

class AppRouter {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String forgotPassword = '/forgot-password';
  static const String otpVerify = '/otp-verify';
  static const String profileSetup = '/profile-setup';

  static const String dashboard = '/dashboard';
  static const String myPlan = '/my-plan';
  static const String fees = '/fees';
  static const String attendance = '/attendance';
  static const String profile = '/profile';
  static const String seatLocker = '/seat-locker';
  static const String timings = '/timings';
  static const String notices = '/notices';
  static const String rules = '/rules';
  static const String support = '/support';
  static const String editProfile = '/edit-profile';
  static const String settings = '/settings';
  static const String reminders = '/reminders';

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case signup:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case otpVerify:
        return MaterialPageRoute(builder: (_) => const OtpVerifyScreen());
      case profileSetup:
        return MaterialPageRoute(
          builder: (_) => const FirstTimeProfileSetupScreen(),
        );
      case dashboard:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      case myPlan:
        return MaterialPageRoute(builder: (_) => const MyPlanScreen());
      case fees:
        return MaterialPageRoute(builder: (_) => const FeesOverviewScreen());
      case attendance:
        return MaterialPageRoute(builder: (_) => const AttendanceScreen());
      case seatLocker:
        return MaterialPageRoute(builder: (_) => const SeatLockerInfoScreen());
      case timings:
        return MaterialPageRoute(builder: (_) => const TimingsHolidaysScreen());
      case notices:
        return MaterialPageRoute(builder: (_) => const NoticesScreen());
      case rules:
        return MaterialPageRoute(builder: (_) => const RulesScreen());
      case support:
        return MaterialPageRoute(builder: (_) => const SupportScreen());
      case profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case editProfile:
        return MaterialPageRoute(builder: (_) => const EditProfileScreen());
      case settings:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case reminders:
        return MaterialPageRoute(builder: (_) => const RemindersScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${routeSettings.name}'),
            ),
          ),
        );
    }
  }
}
