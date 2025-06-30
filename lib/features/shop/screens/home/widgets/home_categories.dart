import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gabon_meuble_app/features/shop/screens/sub_category/sub_categories.dart';
import '../../../../../common/widgets/image_text_widgets/widget_image_text.dart';
import '../../../../../utils/constants/image_strings.dart';

class GMHomeCategories extends StatelessWidget {
  const GMHomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        itemCount: _categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final category = _categories[index];
          return GMVerticalImageText(
            image: category['image']!,
            title: category['title']!,
            onTape:
                () => Get.to(
                  () => SubCategoriesScreen(categoryTitle: category['title']!),
                ),
          );
        },
      ),
    );
  }
}

final List<Map<String, String>> _categories = [
  {'title': 'Menuiserie', 'image': GMImages.menuserie},
  {'title': 'Soudure', 'image': GMImages.soudure},
  {'title': 'Meubles', 'image': GMImages.meubles},
  {'title': 'Decoration', 'image': GMImages.decoration},
  {'title': '100% local', 'image': GMImages.local},
  {'title': 'Mobilier personnalisé', 'image': GMImages.personnaliser},
];
