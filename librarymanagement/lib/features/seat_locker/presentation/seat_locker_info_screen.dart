import 'package:flutter/material.dart';
import '../widgets/locker_details_card.dart';
import '../widgets/seat_details_card.dart';

class SeatLockerInfoScreen extends StatelessWidget {
  const SeatLockerInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Seat & Locker')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: const [
            SeatDetailsCard(
              seatNumber: 'S-12',
              seatType: 'Cabin',
              section: 'Window Side',
            ),
            SizedBox(height: 20),
            LockerDetailsCard(lockerNumber: 'L-08', status: 'Active'),
          ],
        ),
      ),
    );
  }
}
