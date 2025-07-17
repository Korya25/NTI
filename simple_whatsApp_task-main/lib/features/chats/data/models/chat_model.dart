import 'package:simple_whats_app/features/chats/data/models/message_model.dart';

class ChatModel {
  final String id;
  final String name;
  final String lastMessage;
  final String time;
  final String avatarUrl;
  final int unreadCount;
  final List<Message> messages;

  ChatModel({
    required this.id,
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.avatarUrl,
    required this.messages,
    this.unreadCount = 0,
  });
}
