import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/features/shop/screens/chat/controllers/chat_controllers.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  final String artisanName;
  const ChatScreen({super.key, required this.artisanName});

  @override
  Widget build(BuildContext context) {
    final ChatController controller = Get.put(ChatController());
    final TextEditingController inputController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B4D3E),
        title: Text(artisanName, style: const TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.builder(
                reverse: true,
                padding: const EdgeInsets.all(12),
                itemCount: controller.messages.length,
                itemBuilder: (context, index) {
                  final msg = controller.messages.reversed.toList()[index];
                  return Align(
                    alignment:
                        msg.isMe ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color:
                            msg.isMe
                                ? const Color(0xFFD9933D)
                                : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        msg.content,
                        style: TextStyle(
                          color: msg.isMe ? Colors.white : Colors.black87,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 4,
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: inputController,
                    onChanged: (value) => controller.input.value = value,
                    decoration: InputDecoration(
                      hintText: "Écrire un message...",
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: () {
                    controller.sendMessage(inputController.text);
                    inputController.clear();
                  },
                  icon: const Icon(Icons.send, color: Color(0xFFD9933D)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
