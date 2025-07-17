class ChatMessage {
  final String text;
  final bool isDoctor;
  final DateTime timestamp;

  ChatMessage({
    required this.text,
    required this.isDoctor,
    required this.timestamp,
  });
}
