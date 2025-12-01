import 'package:flutter/material.dart';
import '../../data/seat_model.dart';

class SeatMapView extends StatelessWidget {
  final List<Seat> seats;
  final Function(Seat) onSeatSelected;

  const SeatMapView({
    Key? key,
    required this.seats,
    required this.onSeatSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;

        return Stack(
          children: seats.map((seat) {
            return Positioned(
              left: seat.positionX * width,
              top: seat.positionY * height,
              child: GestureDetector(
                onTap: () => onSeatSelected(seat),
                child: _buildSeatWidget(seat),
              ),
            );
          }).toList(),
        );
      },
    );
  }

  Widget _buildSeatWidget(Seat seat) {
    Color color;
    switch (seat.status) {
      case 'available':
        color = Colors.green;
        break;
      case 'occupied':
        color = Colors.red;
        break;
      case 'reserved':
        color = Colors.amber;
        break;
      case 'maintenance':
        color = Colors.grey;
        break;
      default:
        color = Colors.grey;
    }

    final isBooth = seat.type == 'booth';
    final size = isBooth ? 40.0 : 30.0;

    return Tooltip(
      message: '${seat.seatNumber} (${seat.status})',
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(
            isBooth ? 8 : 15,
          ), // Square for booth, circle for standard
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
          border: Border.all(color: Colors.white, width: 1.5),
        ),
        child: Center(
          child: Text(
            seat.seatNumber,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
