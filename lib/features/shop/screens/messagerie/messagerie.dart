import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/common/widgets/appbar/appbar.dart';
import 'package:gabon_meuble_app/features/shop/screens/chat/chat.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  final List<Map<String, String>> messages = const [
    {
      'name': 'Jean Mbadinga',
      'lastMessage': 'Votre commande est presque terminée !',
      'time': '10:45',
      'image': 'assets/images/reviews/review_profile_image_1.jpg',
    },
    {
      'name': 'Sarah Ndong',
      'lastMessage': 'Bonjour ! Avez-vous validé le devis ?',
      'time': 'Hier',
      'image': 'assets/images/reviews/review_profile_image_2.jpeg',
    },
    {
      'name': 'Kevin Mba',
      'lastMessage': 'Merci pour la commande.',
      'time': 'Lun.',
      'image': 'assets/images/reviews/review_profile_image_3.jpeg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GMAppBar(
        showBackArrow: true,
        title: Text(
          "Messagerie",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        actions: [
          IconButton(icon: const Icon(Iconsax.search_normal), onPressed: () {}),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final msg = messages[index];
          return _messageTile(msg);
        },
      ),
    );
  }

  Widget _messageTile(Map<String, String> message) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        leading: CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage(message['image']!),
        ),
        title: Text(
          message['name']!,
          style: const TextStyle(
            fontFamily: 'Nunito',
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          message['lastMessage']!,
          style: const TextStyle(fontSize: 13),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Text(
          message['time']!,
          style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
        ),
        onTap: () {
          Get.to(() => const ChatScreen(artisanName: 'Jean Mbadinga'));
        },
      ),
    );
  }
}
