import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/features/shop/controllers/artisan_controller.dart';
import 'package:get/get.dart';

class FilteredArtisanList extends StatelessWidget {
  const FilteredArtisanList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ArtisanController());
    final filters = [
      'Tous',
      'Libreville',
      'Port-Gentil',
      'Menuiserie',
      'Soudure',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// FILTRES HORIZONTAUX
        SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: filters.length,
            itemBuilder: (context, index) {
              final filter = filters[index];
              return Obx(
                () => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ChoiceChip(
                    label: Text(filter),
                    selected: controller.selectedFilter.value == filter,
                    onSelected: (_) => controller.updateFilter(filter),
                    selectedColor: Colors.orange.shade700,
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 16),

        /// LISTE DES ARTISANS FILTRÉS
        Obx(
          () => ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.filteredArtisans.length,
            itemBuilder: (context, index) {
              final artisan = controller.filteredArtisans[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(artisan.image),
                    radius: 28,
                  ),
                  title: Text(artisan.name),
                  subtitle: Text("${artisan.specialty} - ${artisan.city}"),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
