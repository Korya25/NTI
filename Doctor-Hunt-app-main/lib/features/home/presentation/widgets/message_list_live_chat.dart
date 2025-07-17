import 'package:doctor_hunt/core/constant/app_values.dart';
import 'package:doctor_hunt/features/home/data/models/chat_message_model.dart';
import 'package:doctor_hunt/features/home/data/models/fake_user_model.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/chat_comment_card.dart';
import 'package:flutter/material.dart';

class MessageListLiveChat extends StatelessWidget {
  const MessageListLiveChat({
    super.key,
    required this.messages,
    required this.user,
  });

  final List<ChatMessage> messages;
  final FakeUser user;

  @override
  Widget build(BuildContext context) {
    if (messages.isEmpty) {
      return const SizedBox.shrink();
    }

    return ListView.builder(
      reverse: true,
      padding: AppPadding.all16,
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];

        return ChatCommentCard(fakeUser: user, message: message.text);
      },
    );
  }
}
