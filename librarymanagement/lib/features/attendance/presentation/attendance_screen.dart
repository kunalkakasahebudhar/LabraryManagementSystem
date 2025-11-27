import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../widgets/attendance_calendar.dart';
import '../widgets/attendance_summary_card.dart';
import '../widgets/today_attendance_card.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Attendance')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TodayAttendanceCard(
              isPresent: true,
              inTime: '09:00 AM',
              outTime: '06:00 PM',
            ),
            const SizedBox(height: 24),
            const AttendanceSummaryCard(
              presentDays: 22,
              absentDays: 2,
              totalDays: 24,
            ),
            const SizedBox(height: 24),
            const Text(
              'Monthly View',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimaryLight,
              ),
            ),
            const SizedBox(height: 16),
            const AttendanceCalendar(),
          ],
        ),
      ),
    );
  }
}
