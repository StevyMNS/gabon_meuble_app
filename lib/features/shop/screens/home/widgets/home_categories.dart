import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/features/shop/screens/sub_category/sub_categories.dart';
import 'package:gabon_meuble_app/utils/constants/image_strings.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/image_text_widgets/widget_image_text.dart';

class GMHomeCategories extends StatelessWidget {
  const GMHomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: categoriesList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GMVerticalImageText(
            image: categoriesImage[index],
            title: categoriesList[index],
            onTape: () => Get.to(() => const SubCategoriesScreen()),
          );
        },
      ),
    );
  }
}

List<String> categoriesList = [
  "Artisans",
  "Soudeurs",
  "Menuserier",
  "Meubles intérieurs",
  "Meubles exterieurs",
  "Portails",
];

List<String> categoriesImage = [
  "assets/images/products/bedroom_bed_black.png",
  "assets/images/products/kitchen_counter.png",
  "assets/images/products/bedroom_sofa.png",
  "assets/images/products/bedroom_wardrobe.png",
  "assets/images/products/bedroom_bed_with_comforter.png",
  "assets/images/products/kitchen_dining table.png",
];
