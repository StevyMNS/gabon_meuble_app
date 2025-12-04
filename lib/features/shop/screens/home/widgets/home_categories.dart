import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/features/shop/controllers/categories/category_controller.dart';
import 'package:get/get.dart';
import 'package:gabon_meuble_app/features/shop/screens/sub_category/sub_categories.dart';
import '../../../../../common/widgets/image_text_widgets/widget_image_text.dart';

class GMHomeCategories extends StatelessWidget {
  const GMHomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final categorieController = Get.put(CategorieController());
    return Obx(
      () => SizedBox(
        height: 90,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categorieController.categories.length,
          itemBuilder: (context, index) {
            final cat = categorieController.categories[index];
            return GMVerticalImageText(
              icon: cat.icone,
              title: cat.nom,
              onTape:
                  () =>
                      Get.to(() => SubCategoriesScreen(categoryTitle: cat.nom)),
            );
          },
        ),
      ),
    );
  }
}
