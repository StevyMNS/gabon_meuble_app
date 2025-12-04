import 'package:gabon_meuble_app/data/message_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MessageController extends GetxController {
  final box = GetStorage();

  var messages = <Message>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadMessages();
  }

  void loadMessages() {
    final messagesMap = box.read('messages') as List<dynamic>;
    messages.value = messagesMap.map((e) => Message.fromMap(e)).toList();
  }

  List<Message> messagesParArtisan(int artisanId) {
    return messages.where((m) => m.artisanId == artisanId).toList();
  }
}
