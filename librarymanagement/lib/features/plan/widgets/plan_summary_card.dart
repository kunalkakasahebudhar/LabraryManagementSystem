import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import 'facility_chip.dart';

class PlanSummaryCard extends StatelessWidget {
  final String planName;
  final String duration;
  final String startDate;
  final String endDate;
  final String seatNo;
  final String batch;
  final List<String> facilities;

  const PlanSummaryCard({
    super.key,
    required this.planName,
    required this.duration,
    required this.startDate,
    required this.endDate,
    required this.seatNo,
    required this.batch,
    required this.facilities,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                planName,
                style: AppTextStyles.titleLarge.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColors.success.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Active',
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.success,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            duration,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondaryLight,
            ),
          ),
          const Divider(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildInfoColumn('Start Date', startDate),
              _buildInfoColumn('End Date', endDate),
              _buildInfoColumn('Seat No', seatNo),
            ],
          ),
          const SizedBox(height: 20),
          _buildInfoColumn('Batch Timing', batch),
          const SizedBox(height: 20),
          Text(
            'Facilities Included',
            style: AppTextStyles.labelLarge.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: facilities.map((facility) {
              IconData icon = Icons.check_circle_outline;
              if (facility.contains('WiFi')) icon = Icons.wifi;
              if (facility.contains('AC')) icon = Icons.ac_unit;
              if (facility.contains('Locker')) icon = Icons.lock_outline;
              if (facility.contains('Tea')) icon = Icons.coffee;

              return FacilityChip(label: facility, icon: icon);
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoColumn(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.caption.copyWith(
            color: AppColors.textSecondaryLight,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: AppTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
