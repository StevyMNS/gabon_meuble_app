import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:gabon_meuble_app/common/widgets/images/gm_rounded_image.dart';
import 'package:gabon_meuble_app/common/widgets/texts/gm_brand_title_text_with_verified_icon.dart';
import 'package:gabon_meuble_app/common/widgets/texts/product_title_text.dart';
import 'package:gabon_meuble_app/features/shop/screens/product_details/product_detail.dart';
import 'package:gabon_meuble_app/utils/constants/colors.dart';
import 'package:gabon_meuble_app/utils/constants/image_strings.dart';
import 'package:gabon_meuble_app/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../styles/shadows.dart';
import '../../icons/gm_circular_icon.dart';
import '../products_price/product_price_text.dart';

class GMProductCardVertical extends StatelessWidget {
  const GMProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = GMHelperFunctions.isDarkMode(context);

    /// Container with side paddings, color, edges, radius and shadow,
    return GestureDetector(
      onTap: () => Get.to(() => const ProductDetailScreen()),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [GMShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(GSizes.productImageRadius),
          color: dark ? GMColors.darkerGrey : GMColors.white,
        ),
        child: Column(
          children: [
            /// Thumbnail, WishList Button, Discount Tag
            GMRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(GSizes.sm),
              backgroundColor: dark ? GMColors.dark : GMColors.light,
              child: Stack(
                children: [
                  /// -- Thumbnail Image
                  const GMRoundedImage(
                    imageUrl: GMImages.productImage1,
                    applyImageRadius: true,
                  ),

                  /// -- Sale Tag
                  Positioned(
                    top: 12,
                    child: GMRoundedContainer(
                      radius: GSizes.sm,
                      backgroundColor: GMColors.secondary.withValues(
                        alpha: 0.8,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: GSizes.sm,
                        vertical: GSizes.xs,
                      ),
                      child: Text(
                        "25%",
                        style: Theme.of(
                          context,
                        ).textTheme.labelLarge!.apply(color: GMColors.black),
                      ),
                    ),
                  ),

                  /// -- Favorite Icon Button
                  const Positioned(
                    top: 0,
                    right: 0,
                    child: GMCircularIcon(
                      icon: Iconsax.heart5,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSizes.spaceBtwItems / 2),

            /// -- Details
            const Padding(
              padding: EdgeInsets.only(left: GSizes.sm),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GMProductTitleText(
                      title: "Green Nike Air Shoes",
                      smallSize: true,
                    ),
                    SizedBox(height: GSizes.spaceBtwItems / 2),
                    GMBrandTitleWithVerifiedIcon(title: "Nike"),
                  ],
                ),
              ),
            ),
            const Spacer(),

            /// Price Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Price
                const Padding(
                  padding: EdgeInsets.only(left: GSizes.sm),
                  child: GMProductPriceText(price: '35.0'),
                ),

                /// Add to Cart Button
                Container(
                  decoration: const BoxDecoration(
                    color: GMColors.dark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(GSizes.cardRadiusMd),
                      bottomRight: Radius.circular(GSizes.productImageRadius),
                    ),
                  ),
                  child: const SizedBox(
                    width: GSizes.iconLg * 1.2,
                    height: GSizes.iconLg * 1.2,
                    child: Center(
                      child: Icon(Iconsax.add, color: GMColors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
