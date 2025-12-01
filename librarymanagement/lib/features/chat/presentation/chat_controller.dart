import 'dart:async';
import 'package:flutter/material.dart';
import 'package:librarymanagement/features/chat/data/message_model.dart';

class ChatController extends ChangeNotifier {
  final List<Message> _messages = [];
  bool _isSending = false;
  final ScrollController scrollController = ScrollController();

  List<Message> get messages => List.unmodifiable(_messages);
  bool get isSending => _isSending;

  ChatController() {
    loadInitialMessages();
  }

  void loadInitialMessages() {
    // Dummy initial data
    _messages.addAll([
      Message(
        id: '1',
        text: 'Hello! How can I help you today?',
        senderId: 'staff',
        isMe: false,
        timestamp: DateTime.now().subtract(const Duration(days: 1, hours: 2)),
        status: MessageStatus.seen,
      ),
      Message(
        id: '2',
        text: 'I have a question about my book renewal.',
        senderId: 'student',
        isMe: true,
        timestamp: DateTime.now()
            .subtract(const Duration(days: 1, hours: 1, minutes: 55)),
        status: MessageStatus.seen,
      ),
      Message(
        id: '3',
        text: 'Sure, please provide your student ID.',
        senderId: 'staff',
        isMe: false,
        timestamp: DateTime.now()
            .subtract(const Duration(days: 1, hours: 1, minutes: 50)),
        status: MessageStatus.seen,
      ),
    ]);
    notifyListeners();
  }

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    final newMessage = Message(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: text,
      senderId: 'student',
      isMe: true,
      timestamp: DateTime.now(),
      status: MessageStatus.sent,
    );

    _messages.add(newMessage);
    _scrollToBottom();
    notifyListeners();

    // Simulate network delay and staff reply
    _isSending = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));

    // Update status to delivered
    final index = _messages.indexWhere((m) => m.id == newMessage.id);
    if (index != -1) {
      _messages[index] =
          _messages[index].copyWith(status: MessageStatus.delivered);
      notifyListeners();
    }

    await Future.delayed(const Duration(seconds: 2));
    _isSending = false;
    receiveMessage(
        'Thank you for your message. A staff member will reply shortly.');
  }

  void receiveMessage(String text) {
    final replyMessage = Message(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: text,
      senderId: 'staff',
      isMe: false,
      timestamp: DateTime.now(),
      status: MessageStatus.seen,
    );

    _messages.add(replyMessage);
    _scrollToBottom();
    notifyListeners();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
