import 'package:flutter/material.dart';
import '../widgets/notice_tile.dart';

class NoticesScreen extends StatelessWidget {
  const NoticesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notices & Announcements')),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: 5,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          return NoticeTile(
            title: 'Library closed on 15th Aug',
            description:
                'Library will remain closed on the occasion of Independence Day. Regular timings will resume from 16th Aug.',
            date: '12 Aug 2023',
            isNew: index == 0,
          );
        },
      ),
    );
  }
}
