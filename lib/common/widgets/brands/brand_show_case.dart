import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';
import 'brand_card.dart';

class GMBrandShowcase extends StatelessWidget {
  const GMBrandShowcase({super.key, required this.images});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return GMRoundedContainer(
      showBorder: true,
      borderColor: GMColors.darkerGrey,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(GSizes.md),
      margin: const EdgeInsets.only(bottom: GSizes.spaceBtwItems),
      child: Column(
        children: [
          /// Brand with Products Count
          const GMBrandCard(showBorder: false),
          const SizedBox(height: GSizes.spaceBtwItems),

          /// Brand Top 3 Products Images
          Row(
            children:
                images
                    .map((image) => brandTopProductImageWidget(image, context))
                    .toList(),
          ),
        ],
      ),
    );
  }
}

Widget brandTopProductImageWidget(String image, context) {
  return Expanded(
    child: GMRoundedContainer(
      height: 100,
      padding: const EdgeInsets.all(GSizes.md),
      margin: const EdgeInsets.only(right: GSizes.sm),
      backgroundColor:
          GMHelperFunctions.isDarkMode(context)
              ? GMColors.darkerGrey
              : GMColors.light,
      child: Image(fit: BoxFit.contain, image: AssetImage(image)),
    ),
  );
}
