import 'package:flutter/material.dart';
import '../logic/seat_controller.dart';
import '../data/seat_model.dart';
import 'widgets/seat_map_view.dart';
import 'widgets/seat_chip_filter_bar.dart';
import 'widgets/seat_details_bottom_sheet.dart';

class SeatManagementPage extends StatefulWidget {
  const SeatManagementPage({Key? key}) : super(key: key);

  @override
  State<SeatManagementPage> createState() => _SeatManagementPageState();
}

class _SeatManagementPageState extends State<SeatManagementPage> {
  late SeatController _controller;

  @override
  void initState() {
    super.initState();
    _controller = SeatController();
    _controller.addListener(_onControllerUpdate);
  }

  @override
  void dispose() {
    _controller.removeListener(_onControllerUpdate);
    _controller.dispose();
    super.dispose();
  }

  void _onControllerUpdate() {
    setState(() {});

    // Handle selection change (open bottom sheet)
    if (_controller.selectedSeat != null) {
      // Check if bottom sheet is already open?
      // For simplicity, we might just rely on the user tapping again or
      // we can trigger it here. But usually, the tap event drives the UI.
      // Let's handle the bottom sheet opening in the onTap callback directly
      // to avoid multiple sheets or complex state sync.
    }
  }

  void _handleSeatSelection(Seat seat) {
    _controller.selectSeat(seat);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => SeatDetailsBottomSheet(
        seat: seat,
        isMySeat: _controller.myActiveSeat?.id == seat.id,
        onReserve: () {
          _controller.reserveSeat(seat);
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Seat ${seat.seatNumber} reserved successfully!'),
            ),
          );
        },
        onCancelReservation: () {
          _controller.cancelReservation(seat);
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Reservation cancelled.')),
          );
        },
        onReportIssue: (type, desc) {
          _controller.reportIssue(seat, type, desc);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Issue reported. Thank you.')),
          );
        },
      ),
    ).whenComplete(() {
      _controller.selectSeat(null); // Deselect on close
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Seat Management'), elevation: 0),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search seat (e.g., A1)',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[100],
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
              ),
              onChanged: _controller.setSearchQuery,
            ),
          ),

          // Filter Chips
          SeatChipFilterBar(
            selectedFilter: _controller.filterStatus,
            onFilterSelected: _controller.setFilter,
          ),

          const Divider(height: 1),

          // Map View
          Expanded(
            child: Container(
              color: Colors.grey[50],
              child: Stack(
                children: [
                  // Floor Plan Background (Placeholder)
                  Positioned.fill(
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[300]!, width: 2),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          'Library Floor Plan',
                          style: TextStyle(
                            color: Colors.grey[200],
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Seats
                  Padding(
                    padding: const EdgeInsets.all(
                      20.0,
                    ), // Match container margin
                    child: SeatMapView(
                      seats: _controller.filteredSeats,
                      onSeatSelected: _handleSeatSelection,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Legend
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildLegendItem(Colors.green, 'Available'),
                _buildLegendItem(Colors.amber, 'Reserved'),
                _buildLegendItem(Colors.red, 'Occupied'),
                _buildLegendItem(Colors.grey, 'Maintenance'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLegendItem(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
