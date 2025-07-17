import 'package:flutter/material.dart';
import 'package:simple_whats_app/core/constants/app_colors.dart';
import 'package:simple_whats_app/core/constants/app_strings.dart';
import 'package:simple_whats_app/core/constants/text_styles.dart';
import 'package:simple_whats_app/features/chats/data/models/chat_model.dart';
import 'package:simple_whats_app/features/chats/data/repositories/chat_repo_impl.dart';

class CallsPage extends StatelessWidget {
  const CallsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ChatModel> callLogs = ChatData().getChatsSync();

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.calls),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: ListView.builder(
        itemCount: callLogs.length,
        itemBuilder: (context, index) {
          final call = callLogs[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(call.avatarUrl),
            ),
            title: Text(call.name, style: TextStyles.bodyLarge),
            subtitle: Text(
              call.time,
              style: TextStyles.bodySmall?.copyWith(color: Colors.grey),
            ),
            trailing: Icon(Icons.call, color: AppColors.accent),
            onTap: () {},
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.accent,
        child: const Icon(Icons.add_call, color: AppColors.textLight),
        onPressed: () {},
      ),
    );
  }
}
