import 'package:flutter/material.dart';
import 'package:simple_whats_app/core/constants/text_styles.dart';
import 'package:simple_whats_app/features/chats/data/models/chat_model.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final ChatModel chat;
  final VoidCallback onVideoCall;
  final VoidCallback onVoiceCall;
  final VoidCallback onMoreOptions;

  const ChatAppBar({
    super.key,
    required this.chat,
    required this.onVideoCall,
    required this.onVoiceCall,
    required this.onMoreOptions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          CircleAvatar(
            // ignore: unnecessary_null_comparison
            backgroundImage: chat.avatarUrl != null
                ? NetworkImage(chat.avatarUrl)
                : const AssetImage('assets/default_avatar.png')
                      as ImageProvider,
          ),
          const SizedBox(width: 12),
          Text(chat.name, style: TextStyles.titleMedium),
        ],
      ),
      actions: [
        IconButton(icon: const Icon(Icons.videocam), onPressed: onVideoCall),
        IconButton(icon: const Icon(Icons.call), onPressed: onVoiceCall),
        IconButton(icon: const Icon(Icons.more_vert), onPressed: onMoreOptions),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
