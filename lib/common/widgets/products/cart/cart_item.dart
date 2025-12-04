import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/common/widgets/images/gm_rounded_image.dart';
import 'package:gabon_meuble_app/common/widgets/texts/gm_brand_title_text_with_verified_icon.dart';
import 'package:gabon_meuble_app/common/widgets/texts/product_title_text.dart';
import 'package:gabon_meuble_app/utils/constants/colors.dart';
import 'package:gabon_meuble_app/utils/constants/image_strings.dart';
import 'package:gabon_meuble_app/utils/constants/sizes.dart';
import 'package:gabon_meuble_app/utils/helpers/helper_functions.dart';

class GMCartItem extends StatelessWidget {
  const GMCartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Image
        GMRoundedImage(
          imageUrl: GMImages.productImage1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(GSizes.sm),
          backgroundColor:
              GMHelperFunctions.isDarkMode(context)
                  ? GMColors.darkerGrey
                  : GMColors.light,
        ),
        const SizedBox(width: GSizes.spaceBtwItems),

        /// Title, Price, & Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GMBrandTitleWithVerifiedIcon(title: "Sarah Ndong"),
              Flexible(
                child: GMProductTitleText(
                  title: "Portail vert à motifs dorés",
                  maxLines: 1,
                ),
              ),

              /// Attributes
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Couleur ",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: "Vert ",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    TextSpan(
                      text: "Taille ",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: "2.5m",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
