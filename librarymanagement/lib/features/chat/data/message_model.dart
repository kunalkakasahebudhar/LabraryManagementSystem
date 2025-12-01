import 'package:equatable/equatable.dart';

enum MessageStatus { sent, delivered, seen }

class Message extends Equatable {
  final String id;
  final String text;
  final String senderId;
  final bool isMe;
  final DateTime timestamp;
  final MessageStatus status;

  const Message({
    required this.id,
    required this.text,
    required this.senderId,
    required this.isMe,
    required this.timestamp,
    this.status = MessageStatus.sent,
  });

  Message copyWith({
    String? id,
    String? text,
    String? senderId,
    bool? isMe,
    DateTime? timestamp,
    MessageStatus? status,
  }) {
    return Message(
      id: id ?? this.id,
      text: text ?? this.text,
      senderId: senderId ?? this.senderId,
      isMe: isMe ?? this.isMe,
      timestamp: timestamp ?? this.timestamp,
      status: status ?? this.status,
    );
  }

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'] as String,
      text: json['text'] as String,
      senderId: json['senderId'] as String,
      isMe: json['isMe'] as bool,
      timestamp: DateTime.parse(json['timestamp'] as String),
      status: MessageStatus.values.firstWhere(
        (e) => e.toString().split('.').last == json['status'],
        orElse: () => MessageStatus.sent,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'senderId': senderId,
      'isMe': isMe,
      'timestamp': timestamp.toIso8601String(),
      'status': status.toString().split('.').last,
    };
  }

  @override
  List<Object?> get props => [id, text, senderId, isMe, timestamp, status];
}
