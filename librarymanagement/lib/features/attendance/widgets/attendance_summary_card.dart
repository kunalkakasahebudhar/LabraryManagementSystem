import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';

class AttendanceSummaryCard extends StatelessWidget {
  final int presentDays;
  final int absentDays;
  final int totalDays;

  const AttendanceSummaryCard({
    super.key,
    required this.presentDays,
    required this.absentDays,
    required this.totalDays,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildSummaryItem(
            'Present',
            presentDays.toString(),
            AppColors.success,
          ),
          Container(height: 40, width: 1, color: Colors.grey.shade200),
          _buildSummaryItem('Absent', absentDays.toString(), AppColors.error),
          Container(height: 40, width: 1, color: Colors.grey.shade200),
          _buildSummaryItem(
            'Total',
            totalDays.toString(),
            AppColors.textPrimaryLight,
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryItem(String label, String value, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: AppTextStyles.headlineMedium.copyWith(
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: AppTextStyles.caption.copyWith(
            color: AppColors.textSecondaryLight,
          ),
        ),
      ],
    );
  }
}
