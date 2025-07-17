import 'package:simple_whats_app/features/chats/data/models/chat_model.dart';
import 'package:simple_whats_app/features/chats/data/models/message_model.dart';

class ChatData {
  List<ChatModel> getChatsSync() {
    final now = DateTime.now().subtract(const Duration(days: 1));

    return [
      ChatModel(
        id: '1',
        name: 'John Doe',
        lastMessage: 'Hey, how are you doing?',
        time: _formatTime(now),
        avatarUrl: 'https://randomuser.me/api/portraits/men/1.jpg',
        unreadCount: 2,
        messages: [
          Message(text: 'Hey there!', isMe: false, time: '10:00 AM'),
          Message(text: 'Hi! How are you?', isMe: true, time: '10:02 AM'),
          Message(
            text: 'I was just checking in',
            isMe: false,
            time: '10:05 AM',
          ),
          Message(
            text: 'Hey, how are you doing?',
            isMe: false,
            time: '10:30 AM',
          ),
        ],
      ),
      ChatModel(
        id: '2',
        name: 'Jane Smith',
        lastMessage: 'Meeting at 3 PM',
        time: 'Yesterday',
        avatarUrl: 'https://randomuser.me/api/portraits/women/1.jpg',
        messages: [
          Message(text: 'Hi Jane!', isMe: true, time: 'Yesterday'),
          Message(text: 'Meeting at 3 PM', isMe: false, time: 'Yesterday'),
          Message(text: 'Got it, see you there', isMe: true, time: 'Yesterday'),
        ],
      ),
      ChatModel(
        id: '3',
        name: 'Mark Wilson',
        lastMessage: 'Let\'s catch up soon!',
        time: '9:45 AM',
        avatarUrl: 'https://randomuser.me/api/portraits/men/2.jpg',
        messages: [
          Message(text: 'Long time no see!', isMe: false, time: '9:30 AM'),
          Message(text: 'Let\'s catch up soon!', isMe: false, time: '9:45 AM'),
        ],
      ),
      ChatModel(
        id: '4',
        name: 'Emily Clark',
        lastMessage: 'See you at dinner',
        time: '8:15 AM',
        avatarUrl: 'https://randomuser.me/api/portraits/women/2.jpg',
        messages: [
          Message(text: 'Dinner tonight?', isMe: false, time: '8:00 AM'),
          Message(text: 'Sure, see you at 7!', isMe: true, time: '8:05 AM'),
          Message(text: 'See you at dinner', isMe: false, time: '8:15 AM'),
        ],
      ),
      ChatModel(
        id: '5',
        name: 'David Brown',
        lastMessage: 'Let me know',
        time: 'Yesterday',
        avatarUrl: 'https://randomuser.me/api/portraits/men/3.jpg',
        messages: [
          Message(
            text: 'Can you send me the report?',
            isMe: false,
            time: 'Yesterday',
          ),
          Message(text: 'Sure, working on it.', isMe: true, time: 'Yesterday'),
          Message(text: 'Let me know', isMe: false, time: 'Yesterday'),
        ],
      ),
      ChatModel(
        id: '6',
        name: 'Laura White',
        lastMessage: 'Thanks a lot!',
        time: '12:22 PM',
        avatarUrl: 'https://randomuser.me/api/portraits/women/3.jpg',
        messages: [
          Message(text: 'Here is the file', isMe: true, time: '12:20 PM'),
          Message(text: 'Thanks a lot!', isMe: false, time: '12:22 PM'),
        ],
      ),
      ChatModel(
        id: '7',
        name: 'Chris Evans',
        lastMessage: 'Got the tickets!',
        time: '11:00 AM',
        avatarUrl: 'https://randomuser.me/api/portraits/men/4.jpg',
        messages: [
          Message(
            text: 'Did you book the tickets?',
            isMe: true,
            time: '10:55 AM',
          ),
          Message(text: 'Got the tickets!', isMe: false, time: '11:00 AM'),
        ],
      ),
      ChatModel(
        id: '8',
        name: 'Sophia Taylor',
        lastMessage: 'Call me when free',
        time: 'Yesterday',
        avatarUrl: 'https://randomuser.me/api/portraits/women/4.jpg',
        messages: [
          Message(text: 'Call me when free', isMe: false, time: 'Yesterday'),
        ],
      ),
      ChatModel(
        id: '9',
        name: 'Michael Green',
        lastMessage: 'Happy Birthday!',
        time: 'Today',
        avatarUrl: 'https://randomuser.me/api/portraits/men/5.jpg',
        messages: [
          Message(text: 'Happy Birthday!', isMe: false, time: '8:00 AM'),
        ],
      ),
      ChatModel(
        id: '10',
        name: 'Olivia Martinez',
        lastMessage: 'Loved the gift!',
        time: 'Today',
        avatarUrl: 'https://randomuser.me/api/portraits/women/5.jpg',
        messages: [
          Message(
            text: 'Hope you liked the gift!',
            isMe: true,
            time: '7:50 AM',
          ),
          Message(text: 'Loved the gift!', isMe: false, time: '7:55 AM'),
        ],
      ),
    ];
  }

  String _formatTime(DateTime time) {
    return '${time.hour}:${time.minute.toString().padLeft(2, '0')}';
  }
}
