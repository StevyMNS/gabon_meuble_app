import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:gabon_meuble_app/common/widgets/icons/gm_circular_icon.dart';
import 'package:gabon_meuble_app/common/widgets/images/gm_rounded_image.dart';
import 'package:gabon_meuble_app/common/widgets/products/products_price/product_price_text.dart';
import 'package:gabon_meuble_app/common/widgets/texts/gm_brand_title_text_with_verified_icon.dart';
import 'package:gabon_meuble_app/common/widgets/texts/product_title_text.dart';
import 'package:gabon_meuble_app/utils/constants/colors.dart';
import 'package:gabon_meuble_app/utils/constants/image_strings.dart';
import 'package:gabon_meuble_app/utils/constants/sizes.dart';
import 'package:gabon_meuble_app/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class GMProductCardHorizontal extends StatelessWidget {
  const GMProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = GMHelperFunctions.isDarkMode(context);
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(GSizes.productImageRadius),
        color: dark ? GMColors.darkerGrey : GMColors.softGrey,
      ),
      child: Row(
        children: [
          /// Thumbnail
          GMRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(GSizes.sm),
            backgroundColor: dark ? GMColors.dark : GMColors.light,
            child: Stack(
              children: [
                /// -- Thumbnail Image
                const SizedBox(
                  height: 120,
                  width: 120,
                  child: GMRoundedImage(
                    imageUrl: GMImages.productImage1,
                    applyImageRadius: true,
                  ),
                ),

                /// -- Sale Tag
                Positioned(
                  top: 12,
                  child: GMRoundedContainer(
                    radius: GSizes.sm,
                    backgroundColor: GMColors.secondary.withValues(alpha: 0.8),
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

          /// Details
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(left: GSizes.sm),
              child: Column(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GMProductTitleText(
                        title: "Portail vert à motifs dorés",
                        smallSize: true,
                      ),
                      //SizedBox(height: GSizes.spaceBtwItems / 2),
                      GMBrandTitleWithVerifiedIcon(title: "Sarah Ndong"),
                    ],
                  ),

                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Pricing
                      Flexible(
                        child: const GMProductPriceText(
                          price: "256.0 - 25689.6",
                        ),
                      ),

                      /// Add to cart
                      Container(
                        decoration: const BoxDecoration(
                          color: GMColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(GSizes.cardRadiusMd),
                            bottomRight: Radius.circular(
                              GSizes.productImageRadius,
                            ),
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
          ),
        ],
      ),
    );
  }
}
