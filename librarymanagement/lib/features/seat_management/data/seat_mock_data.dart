import 'dart:math';
import 'seat_model.dart';

List<Seat> generateMockSeats() {
  final List<Seat> seats = [];
  final Random random = Random();
  final int rows = 8;
  final int cols = 5;

  // Generate standard grid seats
  for (int r = 0; r < rows; r++) {
    for (int c = 0; c < cols; c++) {
      final String id = 'seat-$r-$c';
      final String seatNumber =
          '${String.fromCharCode(65 + r)}${c + 1}'; // A1, A2, B1...

      // Calculate position percentages
      // Grid takes up left 80% of width, centered vertically
      final double positionX = (c / (cols - 1)) * 0.7 + 0.05; // 5% to 75%
      final double positionY = (r / (rows - 1)) * 0.8 + 0.1; // 10% to 90%

      // Determine status based on random probability
      final double p = random.nextDouble();
      String status;
      bool isReserved = false;

      if (p < 0.6) {
        status = 'available';
      } else if (p < 0.7) {
        status = 'reserved';
        isReserved = true;
      } else if (p < 0.95) {
        status = 'occupied';
      } else {
        status = 'maintenance';
      }

      seats.add(
        Seat(
          id: id,
          seatNumber: seatNumber,
          status: status,
          isReserved: isReserved,
          positionX: positionX,
          positionY: positionY,
          branchId: 'branch-1',
          libraryId: 'lib-1',
          floor: '1st Floor',
          type: 'standard',
        ),
      );
    }
  }

  // Add 4 private booths on the right side
  for (int i = 0; i < 4; i++) {
    final String id = 'booth-$i';
    final String seatNumber = 'Booth ${i + 1}';

    final double positionX = 0.90; // Right side
    final double positionY = 0.2 + (i * 0.2); // Spread vertically

    final double p = random.nextDouble();
    String status;
    bool isReserved = false;

    if (p < 0.5) {
      status = 'available';
    } else {
      status = 'occupied';
    }

    seats.add(
      Seat(
        id: id,
        seatNumber: seatNumber,
        status: status,
        isReserved: isReserved,
        positionX: positionX,
        positionY: positionY,
        branchId: 'branch-1',
        libraryId: 'lib-1',
        floor: '1st Floor',
        type: 'booth',
      ),
    );
  }

  return seats;
}
