import 'package:flutter/material.dart';
import '../../../core/widgets/section_header.dart';
import '../widgets/fee_history_tile.dart';
import '../widgets/fee_status_card.dart';
import '../widgets/pending_fee_banner.dart';

class FeesOverviewScreen extends StatelessWidget {
  const FeesOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fees & Payments')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PendingFeeBanner(
              message: '₹500 pending for Nov month. Please pay before 5th Nov.',
            ),
            const SizedBox(height: 20),
            const FeeStatusCard(
              totalFees: 1500,
              paidAmount: 1000,
              pendingAmount: 500,
              nextDueDate: '5 Nov 2023',
            ),
            const SizedBox(height: 32),
            SectionHeader(
              title: 'Recent Payments',
              actionText: 'View All',
              onActionTap: () {
                // Navigate to history
              },
            ),
            const SizedBox(height: 16),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                return const FeeHistoryTile(
                  date: '10 Oct 2023',
                  amount: 1500,
                  mode: 'UPI',
                  note: 'October Monthly Fee',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
