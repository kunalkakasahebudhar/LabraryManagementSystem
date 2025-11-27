import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/router/app_router.dart';
import '../../../core/widgets/section_header.dart';
import '../../../core/widgets/status_chip.dart';
import '../widgets/current_plan_card.dart';
import '../widgets/greeting_header.dart';
import '../widgets/notice_preview_tile.dart';
import '../widgets/quick_action_button.dart';
import '../widgets/quick_info_card.dart';
import '../widgets/status_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const GreetingHeader(
                userName: 'Kunal',
                subtitle: AppStrings.dashboardSubtitle,
              ),
              const SizedBox(height: 24),
              const StatusCard(status: StatusType.active, statusText: 'Active'),
              const SizedBox(height: 24),
              const CurrentPlanCard(
                planName: 'Monthly Plan',
                seatType: 'Cabin Seat',
                batch: 'Full Day',
                duration: '1 Nov - 30 Nov',
                daysLeft: 12,
              ),
              const SizedBox(height: 24),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                clipBehavior: Clip.none,
                child: Row(
                  children: [
                    const QuickInfoCard(
                      title: 'Next Due',
                      value: '1 Dec',
                      icon: Icons.calendar_today_outlined,
                    ),
                    const SizedBox(width: 16),
                    const QuickInfoCard(
                      title: 'Pending',
                      value: '₹0',
                      valueColor: AppColors.success,
                      icon: Icons.account_balance_wallet_outlined,
                    ),
                    const SizedBox(width: 16),
                    const QuickInfoCard(
                      title: 'Today',
                      value: 'Present',
                      valueColor: AppColors.success,
                      icon: Icons.check_circle_outline,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              SectionHeader(title: 'Quick Actions'),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  QuickActionButton(
                    label: AppStrings.viewPlan,
                    icon: Icons.card_membership,
                    onTap: () => Navigator.pushNamed(context, AppRouter.myPlan),
                  ),
                  QuickActionButton(
                    label: AppStrings.viewFees,
                    icon: Icons.payment,
                    onTap: () => Navigator.pushNamed(context, AppRouter.fees),
                  ),
                  QuickActionButton(
                    label: AppStrings.viewAttendance,
                    icon: Icons.calendar_month,
                    onTap: () =>
                        Navigator.pushNamed(context, AppRouter.attendance),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              SectionHeader(
                title: 'Notices',
                actionText: 'View All',
                onActionTap: () {
                  // Navigate to notices
                },
              ),
              const SizedBox(height: 16),
              NoticePreviewTile(
                title: 'Library closed on 15th Aug',
                date: '12 Aug 2023',
                isNew: true,
                onTap: () {},
              ),
              NoticePreviewTile(
                title: 'New WiFi password updated',
                date: '10 Aug 2023',
                onTap: () {},
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textSecondaryLight,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Attendance',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.payment), label: 'Fees'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (index) {
          // Handle navigation
        },
      ),
    );
  }
}
