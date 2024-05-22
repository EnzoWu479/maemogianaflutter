import 'package:flutter/material.dart';
import 'package:maemogianaflutter/src/components/chat.dart';
import "package:maemogianaflutter/src/components/components.dart";

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 166, 126, 1),
        title: const Text(
          "MãeMogiana",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: const Chat(),
      bottomNavigationBar: const MyNavigationBar(),
    );
  }
}
