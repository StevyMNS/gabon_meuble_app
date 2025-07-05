import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:gabon_meuble_app/common/widgets/images/gm_rounded_image.dart';
import 'package:gabon_meuble_app/common/widgets/texts/gm_brand_title_text_with_verified_icon.dart';
import 'package:gabon_meuble_app/common/widgets/texts/product_title_text.dart';
import 'package:gabon_meuble_app/common/widgets/products/products_price/product_price_text.dart';
import 'package:gabon_meuble_app/utils/constants/colors.dart';
import 'package:gabon_meuble_app/utils/constants/sizes.dart';
import 'package:gabon_meuble_app/data/product_model.dart';
import 'package:iconsax/iconsax.dart';

class GMProductCardHorizontal extends StatelessWidget {
  final Produit produit;
  const GMProductCardHorizontal({super.key, required this.produit});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(GSizes.productImageRadius),
        color: GMColors.softGrey,
      ),
      child: Row(
        children: [
          /// Thumbnail
          GMRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(GSizes.sm),
            backgroundColor: GMColors.light,
            child: SizedBox(
              height: 120,
              width: 120,
              child: GMRoundedImage(
                imageUrl: produit.image,
                applyImageRadius: true,
              ),
            ),
          ),

          /// Details
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(left: GSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GMProductTitleText(title: produit.titre, smallSize: true),
                  GMBrandTitleWithVerifiedIcon(
                    title: "Artisan #${produit.artisanId}",
                  ),
                  const Spacer(),

                  /// Price Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GMProductPriceText(price: "${produit.prix}"),
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
