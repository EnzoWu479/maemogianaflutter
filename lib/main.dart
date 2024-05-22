import 'package:flutter/material.dart';
import 'package:maemogianaflutter/src/pages/chat_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Chat App",
      home: ChatPage(),
    );
  }
}
