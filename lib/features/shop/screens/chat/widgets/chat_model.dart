class ChatMessage {
  final String content;
  final bool isMe;
  final DateTime timestamp;

  ChatMessage({
    required this.content,
    required this.isMe,
    required this.timestamp,
  });
}
