import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/common/widgets/appbar/appbar.dart';
import 'package:gabon_meuble_app/common/widgets/images/gm_rounded_image.dart';
import 'package:gabon_meuble_app/common/widgets/products/products_cards/product_card_horizontal.dart';
import 'package:gabon_meuble_app/common/widgets/texts/section_heading.dart';
import 'package:gabon_meuble_app/utils/constants/image_strings.dart';
import 'package:gabon_meuble_app/utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GMAppBar(title: Text("Sport"), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(GSizes.defaultSpace),
          child: Column(
            children: [
              /// Banner
              const GMRoundedImage(
                width: double.infinity,
                imageUrl: GMImages.promoBanner1,
                applyImageRadius: true,
              ),
              const SizedBox(height: GSizes.spaceBtwSections),

              /// Sub Categories
              Column(
                children: [
                  /// Heading
                  GMSectionHeading(title: "Sport Shirts", onPressed: () {}),
                  const SizedBox(height: GSizes.spaceBtwItems / 2),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder:
                          (context, index) =>
                              const SizedBox(width: GSizes.spaceBtwItems),
                      itemBuilder:
                          (context, index) => const GMProductCardHorizontal(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
