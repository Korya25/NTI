import 'package:flutter/material.dart';
import 'package:simple_whats_app/features/chats/data/models/chat_model.dart';
import 'package:simple_whats_app/features/chats/data/models/message_model.dart';
import 'package:simple_whats_app/features/chats/presentation/widgets/chat_app_bar.dart';
import 'package:simple_whats_app/features/chats/presentation/widgets/message_bubble.dart';
import 'package:simple_whats_app/features/chats/presentation/widgets/message_input.dart';

class ChatRoomView extends StatefulWidget {
  final ChatModel chat;
  const ChatRoomView({super.key, required this.chat});

  @override
  State<ChatRoomView> createState() => _ChatRoomViewState();
}

class _ChatRoomViewState extends State<ChatRoomView> {
  late List<Message> messages;

  @override
  void initState() {
    super.initState();
    messages = List.from(widget.chat.messages);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatAppBar(
        chat: widget.chat,
        onVideoCall: () {},
        onVoiceCall: () {},
        onMoreOptions: () {},
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              padding: const EdgeInsets.all(16),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return MessageBubble(
                  message: messages[index],
                  isMe: messages[index].isMe,
                );
              },
            ),
          ),
          MessageInput(onSend: _handleSendMessage),
        ],
      ),
    );
  }

  void _handleSendMessage(String text) {
    if (text.trim().isEmpty) return;
    setState(() {
      messages.insert(
        0,
        Message(
          text: text,
          isMe: true,
          time: DateTime.now().toString().substring(11, 16),
        ),
      );
    });
  }
}
