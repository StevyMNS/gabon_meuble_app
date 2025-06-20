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
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return GMVerticalImageText(
            image: GMImages.furnitureIcon,
            title: 'Artisans',
            onTape: () => Get.to(() => const SubCategoriesScreen()),
          );
        },
      ),
    );
  }
}
