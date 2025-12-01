import 'package:flutter/material.dart';
import '../../data/seat_model.dart';

class SeatDetailsBottomSheet extends StatelessWidget {
  final Seat seat;
  final bool isMySeat;
  final VoidCallback onReserve;
  final VoidCallback onCancelReservation;
  final Function(String, String) onReportIssue;

  const SeatDetailsBottomSheet({
    Key? key,
    required this.seat,
    required this.isMySeat,
    required this.onReserve,
    required this.onCancelReservation,
    required this.onReportIssue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Seat ${seat.seatNumber}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (isMySeat)
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'MY SEAT',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
              _buildStatusBadge(seat.status),
            ],
          ),
          const SizedBox(height: 24),

          // Details Grid
          Row(
            children: [
              _buildDetailItem(Icons.layers, 'Floor', seat.floor ?? 'N/A'),
              const SizedBox(width: 24),
              _buildDetailItem(Icons.chair, 'Type', seat.type.toUpperCase()),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildDetailItem(Icons.location_on, 'Branch', seat.branchId),
              const SizedBox(width: 24),
              _buildDetailItem(Icons.meeting_room, 'Library', seat.libraryId),
            ],
          ),
          const SizedBox(height: 32),

          // Actions
          if (seat.status == 'available')
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onReserve,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Reserve Seat',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

          if (isMySeat)
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: onCancelReservation,
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red,
                  side: const BorderSide(color: Colors.red),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Cancel Reservation',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),

          if (!isMySeat && seat.status != 'available')
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: null, // Disabled
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  seat.status == 'maintenance'
                      ? 'Under Maintenance'
                      : 'Not Available',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

          const SizedBox(height: 16),

          Center(
            child: TextButton.icon(
              onPressed: () => _showReportIssueDialog(context),
              icon: const Icon(
                Icons.report_problem_outlined,
                size: 18,
                color: Colors.grey,
              ),
              label: const Text(
                'Report Issue',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildStatusBadge(String status) {
    Color color;
    switch (status) {
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

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color),
      ),
      child: Text(
        status.toUpperCase(),
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildDetailItem(IconData icon, String label, String value) {
    return Expanded(
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey[600]),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(color: Colors.grey[500], fontSize: 12),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showReportIssueDialog(BuildContext context) {
    final TextEditingController descriptionController = TextEditingController();
    String selectedIssue = 'Noise';

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('Report Issue'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButtonFormField<String>(
                value: selectedIssue,
                items: ['Noise', 'Power Socket', 'Chair Broken', 'Other']
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (val) => setState(() => selectedIssue = val!),
                decoration: const InputDecoration(labelText: 'Issue Type'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description (Optional)',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                onReportIssue(selectedIssue, descriptionController.text);
                Navigator.pop(context);
              },
              child: const Text('Report'),
            ),
          ],
        ),
      ),
    );
  }
}
