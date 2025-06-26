import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/utils/constants/colors.dart';
import 'package:gabon_meuble_app/utils/helpers/helper_functions.dart';

class ArtisanCard extends StatelessWidget {
  final String name;
  final String speciality;
  final String location;
  final String image;

  const ArtisanCard({
    super.key,
    required this.name,
    required this.speciality,
    required this.location,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final dark = GMHelperFunctions.isDarkMode(context);

    return Card(
      color: dark ? GMColors.darkerGrey : GMColors.white,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(backgroundImage: AssetImage(image), radius: 28),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text("$speciality - $location"),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          // TODO: Naviguer vers la fiche artisan
        },
      ),
    );
  }
}
