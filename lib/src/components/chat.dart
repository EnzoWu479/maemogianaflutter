import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:maemogianaflutter/src/service/ai/gemini_ai.dart';
import 'package:maemogianaflutter/src/service/chat_service.dart';
import 'package:maemogianaflutter/src/utils/prompts/initial_promp.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<StatefulWidget> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final chatService = ChatService(GeminiAi(), initialPrompt);

  final ChatUser _currentUser =
      ChatUser(id: "1", firstName: "Maria", lastName: "Eduarda");
  final ChatUser _gptChatUser =
      ChatUser(id: "2", firstName: "Ana", lastName: "AI");
  final List<ChatMessage> _messages = [];

  Future<void> getChatResponse(ChatMessage message) async {
    setState(() {
      _messages.insert(0, message);
      sendChatRequest(message);
    });
  }

  Future<void> sendChatRequest(ChatMessage message) async {
    final chatResponse = await chatService.getReply(message.text);
    final newMessage = ChatMessage(
        text: chatResponse, user: _gptChatUser, createdAt: DateTime.now());
    setState(() {
      _messages.insert(0, newMessage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DashChat(
      currentUser: _currentUser,
      messageOptions: const MessageOptions(
          currentUserContainerColor: Colors.black,
          containerColor: Colors.purple,
          textColor: Colors.white),
      onSend: (ChatMessage message) {
        getChatResponse(message);
      },
      messages: _messages,
    );
  }
}
