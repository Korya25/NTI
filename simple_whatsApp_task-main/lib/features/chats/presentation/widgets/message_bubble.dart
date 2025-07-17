import 'package:flutter/material.dart';
import 'package:simple_whats_app/core/constants/app_colors.dart';
import 'package:simple_whats_app/core/constants/text_styles.dart';
import 'package:simple_whats_app/features/chats/data/models/message_model.dart';

class MessageBubble extends StatelessWidget {
  final Message message;
  final bool isMe;
  const MessageBubble({super.key, required this.message, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isMe
              ? AppColors.messageBubbleMe
              : AppColors.messageBubbleOther,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(12),
            topRight: const Radius.circular(12),
            bottomLeft: isMe ? const Radius.circular(12) : Radius.zero,
            bottomRight: isMe ? Radius.zero : const Radius.circular(12),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 2,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: isMe
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            Text(
              message.text,
              style: TextStyles.bodyMedium.copyWith(
                color: isMe ? AppColors.textLight : AppColors.textDark,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              message.time,
              style: TextStyles.bodySmall.copyWith(
                color: isMe
                    ? AppColors.messageTimeMe
                    : const Color.fromARGB(255, 33, 33, 33),
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
