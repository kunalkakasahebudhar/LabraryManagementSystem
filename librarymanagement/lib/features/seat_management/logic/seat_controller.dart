import 'package:flutter/material.dart';
import '../data/seat_model.dart';
import '../data/seat_mock_data.dart';

class SeatController extends ChangeNotifier {
  List<Seat> _allSeats = [];
  List<Seat> _filteredSeats = [];
  Seat? _selectedSeat;
  String _filterStatus =
      'all'; // 'all', 'available', 'occupied', 'reserved', 'maintenance'
  String _searchQuery = '';
  String? _myActiveSeatId;

  // Getters
  List<Seat> get filteredSeats => _filteredSeats;
  Seat? get selectedSeat => _selectedSeat;
  String get filterStatus => _filterStatus;
  String get searchQuery => _searchQuery;
  Seat? get myActiveSeat => _allSeats.cast<Seat?>().firstWhere(
    (seat) => seat?.id == _myActiveSeatId,
    orElse: () => null,
  );

  SeatController() {
    _loadInitialData();
  }

  void _loadInitialData() {
    _allSeats = generateMockSeats();
    _applyFilters();
  }

  void setFilter(String status) {
    _filterStatus = status;
    _applyFilters();
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    _applyFilters();
  }

  void selectSeat(Seat? seat) {
    _selectedSeat = seat;
    notifyListeners();
  }

  void _applyFilters() {
    _filteredSeats = _allSeats.where((seat) {
      final matchesStatus =
          _filterStatus == 'all' ||
          (_filterStatus == 'available' && seat.status == 'available') ||
          (_filterStatus == 'occupied' && seat.status == 'occupied') ||
          (_filterStatus == 'reserved' && seat.status == 'reserved') ||
          (_filterStatus == 'maintenance' && seat.status == 'maintenance');

      final query = _searchQuery.toLowerCase();
      final matchesQuery =
          seat.seatNumber.toLowerCase().contains(query) ||
          seat.id.toLowerCase().contains(query);

      return matchesStatus && matchesQuery;
    }).toList();
    notifyListeners();
  }

  // Student Actions

  void reserveSeat(Seat seat) {
    if (seat.status != 'available') return;

    if (_myActiveSeatId != null) {
      // Already has a reservation
      return;
    }

    final index = _allSeats.indexWhere((s) => s.id == seat.id);
    if (index != -1) {
      final updatedSeat = seat.copyWith(status: 'reserved', isReserved: true);
      _allSeats[index] = updatedSeat;
      _myActiveSeatId = seat.id;
      _selectedSeat = updatedSeat; // Update selected view
      _applyFilters();
    }
  }

  void cancelReservation(Seat seat) {
    if (_myActiveSeatId != seat.id) return;

    final index = _allSeats.indexWhere((s) => s.id == seat.id);
    if (index != -1) {
      final updatedSeat = seat.copyWith(status: 'available', isReserved: false);
      _allSeats[index] = updatedSeat;
      _myActiveSeatId = null;
      _selectedSeat = updatedSeat;
      _applyFilters();
    }
  }

  void reportIssue(Seat seat, String issueType, String description) {
    final index = _allSeats.indexWhere((s) => s.id == seat.id);
    if (index != -1) {
      final updatedSeat = seat.copyWith(status: 'maintenance');
      _allSeats[index] = updatedSeat;

      // If this was my seat, clear my reservation
      if (_myActiveSeatId == seat.id) {
        _myActiveSeatId = null;
      }

      _selectedSeat = updatedSeat;
      _applyFilters();
    }
  }
}
