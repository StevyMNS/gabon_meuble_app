import 'package:gabon_meuble_app/features/shop/screens/chat/widgets/chat_model.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  var messages = <ChatMessage>[].obs;
  final RxString input = ''.obs;

  void sendMessage(String text) {
    if (text.trim().isEmpty) return;
    messages.add(
      ChatMessage(content: text.trim(), isMe: true, timestamp: DateTime.now()),
    );

    // Simuler une réponse automatique
    Future.delayed(const Duration(seconds: 1), () {
      messages.add(
        ChatMessage(
          content: "Merci pour votre message !",
          isMe: false,
          timestamp: DateTime.now(),
        ),
      );
    });

    input.value = '';
  }
}
