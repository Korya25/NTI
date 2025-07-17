import 'package:flutter/material.dart';
import 'package:simple_whats_app/core/constants/app_colors.dart';
import 'package:simple_whats_app/core/constants/app_sizes.dart';
import 'package:simple_whats_app/core/constants/text_styles.dart';
import 'package:simple_whats_app/features/chats/data/models/chat_model.dart';
import 'package:simple_whats_app/features/chats/presentation/views/charroom_view.dart';

class ChatItem extends StatelessWidget {
  final ChatModel chat;

  const ChatItem({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: AppSizes.avatarRadius,
        backgroundImage: NetworkImage(chat.avatarUrl),
      ),
      title: Text(chat.name, style: TextStyles.titleMedium),
      subtitle: Text(
        chat.lastMessage,
        style: TextStyles.bodySmall,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(chat.time, style: TextStyles.bodySmall),
          if (chat.unreadCount > 0)
            Container(
              margin: const EdgeInsets.only(top: 4.0),
              padding: const EdgeInsets.all(4.0),
              decoration: const BoxDecoration(
                color: AppColors.accent,
                shape: BoxShape.circle,
              ),
              child: Text(
                chat.unreadCount.toString(),
                style: TextStyles.bodySmall.copyWith(
                  color: AppColors.textLight,
                  fontSize: 10,
                ),
              ),
            ),
        ],
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatRoomView(chat: chat)),
        );
      },
    );
  }
}
