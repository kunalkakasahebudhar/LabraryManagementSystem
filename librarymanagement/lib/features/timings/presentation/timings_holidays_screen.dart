import 'package:flutter/material.dart';
import '../../../core/widgets/section_header.dart';
import '../widgets/holiday_tile.dart';
import '../widgets/timing_card.dart';

class TimingsHolidaysScreen extends StatelessWidget {
  const TimingsHolidaysScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Timings & Holidays')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TimingCard(
              title: "Today's Timing",
              time: '06:00 AM - 10:00 PM',
              icon: Icons.access_time_filled,
            ),
            const SizedBox(height: 16),
            const TimingCard(
              title: 'My Batch',
              time: 'Full Day (06:00 AM - 10:00 PM)',
              icon: Icons.schedule,
            ),
            const SizedBox(height: 32),
            SectionHeader(title: 'Upcoming Holidays'),
            const SizedBox(height: 16),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                return const HolidayTile(
                  date: '15 Aug',
                  occasion: 'Independence Day',
                  day: 'Tuesday',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
