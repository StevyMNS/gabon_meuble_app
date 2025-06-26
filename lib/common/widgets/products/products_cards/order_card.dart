import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/utils/constants/colors.dart';
import 'package:gabon_meuble_app/utils/helpers/helper_functions.dart';

class OrderCard extends StatelessWidget {
  final String productName;
  final String status;
  final VoidCallback? onPressed;

  const OrderCard({
    super.key,
    required this.productName,
    required this.status,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final dark = GMHelperFunctions.isDarkMode(context);

    return Card(
      color: dark ? GMColors.darkerGrey : GMColors.white,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: const Icon(Icons.chair_alt),
        title: Text(productName),
        subtitle: Text("Statut : $status"),
        trailing: TextButton(onPressed: onPressed, child: const Text("Suivre")),
      ),
    );
  }
}
