import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/common/widgets/brands/brand_show_case.dart';
import 'package:gabon_meuble_app/common/widgets/layouts/grid_layout.dart';
import 'package:gabon_meuble_app/common/widgets/products/products_cards/product_card_vertical.dart';
import 'package:gabon_meuble_app/common/widgets/texts/section_heading.dart';
import 'package:gabon_meuble_app/utils/constants/image_strings.dart';
import 'package:gabon_meuble_app/utils/constants/sizes.dart';

class GMCategoryTab extends StatelessWidget {
  const GMCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(GSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Brands
              const GMBrandShowcase(
                images: [
                  GMImages.productImage3,
                  GMImages.productImage2,
                  GMImages.productImage1,
                ],
              ),
              const GMBrandShowcase(
                images: [
                  GMImages.productImage3,
                  GMImages.productImage2,
                  GMImages.productImage1,
                ],
              ),
              const SizedBox(height: GSizes.spaceBtwItems),

              /// -- Products
              GMSectionHeading(title: "you might like", onPressed: () {}),
              const SizedBox(height: GSizes.spaceBtwItems),

              GMGridLayout(
                itemCount: 4,
                itemBuilder: (_, index) => const GMProductCardVertical(),
              ),
              const SizedBox(height: GSizes.spaceBtwItems),
            ],
          ),
        ),
      ],
    );
  }
}
