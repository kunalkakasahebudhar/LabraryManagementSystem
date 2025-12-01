import 'package:equatable/equatable.dart';

class Seat extends Equatable {
  final String id;
  final String seatNumber;
  final String status; // 'available', 'occupied', 'reserved', 'maintenance'
  final bool isReserved;
  final double positionX; // 0.0 to 1.0 (percentage)
  final double positionY; // 0.0 to 1.0 (percentage)
  final String branchId;
  final String libraryId;
  final String? floor;
  final String type; // 'standard', 'premium', 'booth'

  const Seat({
    required this.id,
    required this.seatNumber,
    required this.status,
    required this.isReserved,
    required this.positionX,
    required this.positionY,
    required this.branchId,
    required this.libraryId,
    this.floor,
    this.type = 'standard',
  });

  Seat copyWith({
    String? id,
    String? seatNumber,
    String? status,
    bool? isReserved,
    double? positionX,
    double? positionY,
    String? branchId,
    String? libraryId,
    String? floor,
    String? type,
  }) {
    return Seat(
      id: id ?? this.id,
      seatNumber: seatNumber ?? this.seatNumber,
      status: status ?? this.status,
      isReserved: isReserved ?? this.isReserved,
      positionX: positionX ?? this.positionX,
      positionY: positionY ?? this.positionY,
      branchId: branchId ?? this.branchId,
      libraryId: libraryId ?? this.libraryId,
      floor: floor ?? this.floor,
      type: type ?? this.type,
    );
  }

  factory Seat.fromJson(Map<String, dynamic> json) {
    return Seat(
      id: json['id'],
      seatNumber: json['seatNumber'],
      status: json['status'],
      isReserved: json['isReserved'] ?? false,
      positionX: (json['positionX'] as num).toDouble(),
      positionY: (json['positionY'] as num).toDouble(),
      branchId: json['branchId'],
      libraryId: json['libraryId'],
      floor: json['floor'],
      type: json['type'] ?? 'standard',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'seatNumber': seatNumber,
      'status': status,
      'isReserved': isReserved,
      'positionX': positionX,
      'positionY': positionY,
      'branchId': branchId,
      'libraryId': libraryId,
      'floor': floor,
      'type': type,
    };
  }

  @override
  List<Object?> get props => [
    id,
    seatNumber,
    status,
    isReserved,
    positionX,
    positionY,
    branchId,
    libraryId,
    floor,
    type,
  ];
}
