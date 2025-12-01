import 'package:flutter/material.dart';

class SeatChipFilterBar extends StatelessWidget {
  final String selectedFilter;
  final Function(String) onFilterSelected;

  const SeatChipFilterBar({
    Key? key,
    required this.selectedFilter,
    required this.onFilterSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final filters = [
      {'label': 'All', 'value': 'all'},
      {'label': 'Available', 'value': 'available'},
      {'label': 'Reserved', 'value': 'reserved'},
      {'label': 'Occupied', 'value': 'occupied'},
      {'label': 'Maintenance', 'value': 'maintenance'},
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: filters.map((filter) {
          final isSelected = selectedFilter == filter['value'];
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: FilterChip(
              label: Text(filter['label']!),
              selected: isSelected,
              onSelected: (bool selected) {
                if (selected) {
                  onFilterSelected(filter['value']!);
                }
              },
              backgroundColor: Colors.grey[200],
              selectedColor: Theme.of(
                context,
              ).primaryColor.withValues(alpha: 0.2),
              labelStyle: TextStyle(
                color: isSelected
                    ? Theme.of(context).primaryColor
                    : Colors.black87,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
              checkmarkColor: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  color: isSelected
                      ? Theme.of(context).primaryColor
                      : Colors.transparent,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
