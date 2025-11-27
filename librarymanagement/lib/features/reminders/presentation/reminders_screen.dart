import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../widgets/reminder_banner.dart';

class RemindersScreen extends StatelessWidget {
  const RemindersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reminders & Alerts')),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: 3,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          if (index == 0) {
            return const ReminderBanner(
              title: 'Fees Due Soon',
              message:
                  'Your monthly fee is due on 5th Nov. Please pay to avoid late charges.',
              color: AppColors.error,
              icon: Icons.warning_amber_rounded,
            );
          } else if (index == 1) {
            return const ReminderBanner(
              title: 'Library Closed',
              message: 'Library will remain closed tomorrow for maintenance.',
              color: AppColors.primary,
              icon: Icons.info_outline,
            );
          } else {
            return const ReminderBanner(
              title: 'New Books Arrived',
              message:
                  'Check out the new collection of engineering books in Section B.',
              color: AppColors.success,
              icon: Icons.book,
            );
          }
        },
      ),
    );
  }
}
