import 'package:flutter/material.dart';
import 'package:librarymanagement/features/seat_management/presentation/seat_management_page.dart';

void main() {
  runApp(const SeatManagementApp());
}

class SeatManagementApp extends StatelessWidget {
  const SeatManagementApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seat Management Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      home: const SeatManagementPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
