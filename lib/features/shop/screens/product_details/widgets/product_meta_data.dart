import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:gabon_meuble_app/common/widgets/images/gm_circular_image.dart';
import 'package:gabon_meuble_app/common/widgets/products/products_price/product_price_text.dart';
import 'package:gabon_meuble_app/common/widgets/texts/gm_brand_title_text_with_verified_icon.dart';
import 'package:gabon_meuble_app/common/widgets/texts/product_title_text.dart';
import 'package:gabon_meuble_app/utils/constants/colors.dart';
import 'package:gabon_meuble_app/utils/constants/enums.dart';
import 'package:gabon_meuble_app/utils/constants/image_strings.dart';
import 'package:gabon_meuble_app/utils/constants/sizes.dart';
import 'package:gabon_meuble_app/utils/helpers/helper_functions.dart';

class GMProductMetaData extends StatelessWidget {
  const GMProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = GMHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price & sale Price
        Row(
          children: [
            /// Sale Tag
            GMRoundedContainer(
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
                ).textTheme.labelLarge!.apply(color: GMColors.dark),
              ),
            ),
            const SizedBox(width: GSizes.spaceBtwItems),

            /// Price
            Text(
              "\$250",
              style: Theme.of(context).textTheme.titleSmall!.apply(
                decoration: TextDecoration.lineThrough,
              ),
            ),
            const SizedBox(width: GSizes.spaceBtwItems),
            GMProductPriceText(price: "175", isLarge: true),
          ],
        ),
        const SizedBox(height: GSizes.spaceBtwItems / 1.5),

        /// Title
        GMProductTitleText(title: "Green Nike Sport Shirt"),
        const SizedBox(height: GSizes.spaceBtwItems / 1.5),

        /// Stack Status
        Row(
          children: [
            const GMProductTitleText(title: "Statut"),
            const SizedBox(width: GSizes.spaceBtwItems),
            Text("En stock", style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: GSizes.spaceBtwItems / 1.5),

        /// Brand
        Row(
          children: [
            GMCircularImage(
              image: GMImages.shoeIcon,
              width: 32,
              height: 32,
              overlayColor: darkMode ? GMColors.white : GMColors.black,
            ),
            const GMBrandTitleWithVerifiedIcon(
              title: "Nike",
              brandTextSize: TextSizes.medium,
            ),
          ],
        ),
      ],
    );
  }
}
