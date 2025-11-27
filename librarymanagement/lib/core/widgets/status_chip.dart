import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

enum StatusType { active, inactive, pending, warning }

class StatusChip extends StatelessWidget {
  final String label;
  final StatusType type;
  final Color? customColor;
  final Color? customTextColor;

  const StatusChip({
    super.key,
    required this.label,
    this.type = StatusType.active,
    this.customColor,
    this.customTextColor,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color textColor;

    switch (type) {
      case StatusType.active:
        backgroundColor = AppColors.chipActive;
        textColor = AppColors.chipActiveText;
        break;
      case StatusType.pending:
        backgroundColor = AppColors.chipPending;
        textColor = AppColors.chipPendingText;
        break;
      case StatusType.inactive:
        backgroundColor = AppColors.chipInactive;
        textColor = AppColors.chipInactiveText;
        break;
      case StatusType.warning:
        backgroundColor = AppColors.error.withOpacity(0.1);
        textColor = AppColors.error;
        break;
    }

    if (customColor != null) backgroundColor = customColor!;
    if (customTextColor != null) textColor = customTextColor!;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: AppTextStyles.caption.copyWith(
          color: textColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
