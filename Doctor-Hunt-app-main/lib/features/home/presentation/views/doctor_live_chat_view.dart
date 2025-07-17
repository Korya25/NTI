import 'package:doctor_hunt/core/presentation/widgets/cached_network_image_with_shimmer.dart';
import 'package:doctor_hunt/core/presentation/widgets/custom_animate_do.dart';
import 'package:doctor_hunt/features/home/data/models/chat_message_model.dart';
import 'package:doctor_hunt/features/home/data/models/doctor_model.dart';
import 'package:doctor_hunt/features/home/data/models/fake_user_model.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/header_live_chat.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/message_list_live_chat.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/send_meesage_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorLiveChatView extends StatefulWidget {
  const DoctorLiveChatView({
    super.key,
    required this.doctorModel,
    required this.user,
  });

  final FakeUser user;
  final DoctorModel doctorModel;

  @override
  State<DoctorLiveChatView> createState() => _DoctorLiveChatViewState();
}

class _DoctorLiveChatViewState extends State<DoctorLiveChatView> {
  late final TextEditingController _messageController;
  final List<ChatMessage> _messages = [];

  @override
  void initState() {
    super.initState();
    _messageController = TextEditingController();
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _handleSendMessage() {
    final messageText = _messageController.text.trim();
    if (messageText.isEmpty) return;

    setState(() {
      _messages.insert(
        0,
        ChatMessage(
          text: messageText,
          isDoctor: false,
          timestamp: DateTime.now(),
        ),
      );
      _messageController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackground(),
          SafeArea(
            child: Column(
              children: [
                CustomFadeIn(
                  direction: FadeDirection.left,
                  child: HeaderLiveChat(image: widget.doctorModel.image),
                ),
                Expanded(
                  child: MessageListLiveChat(
                    messages: _messages,
                    user: widget.user,
                  ),
                ),
                CustomFadeIn(
                  direction: FadeDirection.right,
                  child: SendMessageField(
                    controller: _messageController,
                    onSend: _handleSendMessage,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return Positioned.fill(
      child: Stack(
        children: [
          CachedNetworkImageWithShimmer(
            height: double.infinity,
            width: double.infinity,
            imageUrl: widget.doctorModel.image,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 200.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black.withAlpha(200), Colors.transparent],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
