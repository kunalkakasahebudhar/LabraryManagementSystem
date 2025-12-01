import 'package:flutter/material.dart';
import 'package:librarymanagement/features/chat/presentation/chat_screen.dart';

void main() {
  runApp(const ChatFeatureDemo());
}

class ChatFeatureDemo extends StatelessWidget {
  const ChatFeatureDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Feature Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      home: const ChatDemoHome(),
    );
  }
}

class ChatDemoHome extends StatelessWidget {
  const ChatDemoHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Library App')),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const ChatScreen()),
            );
          },
          icon: const Icon(Icons.chat_bubble_outline),
          label: const Text('Open Support Chat'),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            textStyle: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
