import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';

class RuleCategorySection extends StatelessWidget {
  final String title;
  final List<String> rules;

  const RuleCategorySection({
    super.key,
    required this.title,
    required this.rules,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.titleLarge.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        ...rules.map(
          (rule) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 6),
                  child: Icon(
                    Icons.circle,
                    size: 6,
                    color: AppColors.textSecondaryLight,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(child: Text(rule, style: AppTextStyles.bodyLarge)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
