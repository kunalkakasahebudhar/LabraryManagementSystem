import 'package:flutter/material.dart';
import '../widgets/fee_history_tile.dart';

class FeeHistoryScreen extends StatelessWidget {
  const FeeHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payment History')),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: 10,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          return const FeeHistoryTile(
            date: '10 Oct 2023',
            amount: 1500,
            mode: 'UPI',
            note: 'Monthly Fee',
          );
        },
      ),
    );
  }
}
