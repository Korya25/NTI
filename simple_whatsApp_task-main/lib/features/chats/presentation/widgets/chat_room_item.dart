import 'package:flutter/material.dart';
import 'package:simple_whats_app/features/chats/data/models/chat_model.dart';
import 'package:simple_whats_app/features/chats/presentation/views/charroom_view.dart';

class ChatItemRoom extends StatelessWidget {
  final ChatModel chat;

  const ChatItemRoom({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatRoomView(chat: chat)),
        );
      },
    );
  }
}
