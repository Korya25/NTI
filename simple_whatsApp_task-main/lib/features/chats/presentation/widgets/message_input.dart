import 'package:flutter/material.dart';
import 'package:simple_whats_app/core/constants/app_colors.dart';
import 'package:simple_whats_app/core/constants/app_strings.dart';

class MessageInput extends StatefulWidget {
  final Function(String) onSend;
  const MessageInput({super.key, required this.onSend});

  @override
  State<MessageInput> createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
          ),
        ],
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.emoji_emotions_outlined),
            onPressed: _handleEmojiPress,
          ),
          IconButton(
            icon: const Icon(Icons.attach_file),
            onPressed: _handleAttachmentPress,
          ),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: AppStrings.typeMessageHint,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: AppColors.lightGrey,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),
          IconButton(icon: const Icon(Icons.mic), onPressed: _handleMicPress),
          IconButton(
            icon: const Icon(Icons.send, color: AppColors.accent),
            onPressed: _handleSend,
          ),
        ],
      ),
    );
  }

  void _handleSend() {
    widget.onSend(_controller.text);
    _controller.clear();
  }

  void _handleEmojiPress() {
    // Implement emoji picker
  }

  void _handleAttachmentPress() {
    // Implement attachment
  }

  void _handleMicPress() {
    // Implement voice message
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
