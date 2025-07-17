import 'package:flutter/material.dart';
import 'package:simple_whats_app/core/constants/app_colors.dart';
import 'package:simple_whats_app/core/constants/app_strings.dart';
import 'package:simple_whats_app/features/chats/data/repositories/chat_repo_impl.dart';
import 'package:simple_whats_app/features/chats/presentation/widgets/chat_item.dart';

class ChatsPage extends StatelessWidget {
  final ChatData _chatRepository = ChatData();

  ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final chats = _chatRepository.getChatsSync();

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.chats),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          return ChatItem(chat: chats[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.accent,
        child: const Icon(Icons.chat, color: Colors.white),
        onPressed: () {},
      ),
    );
  }
}
