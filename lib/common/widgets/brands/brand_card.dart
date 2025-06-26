import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';
import '../images/gm_circular_image.dart';
import '../texts/gm_brand_title_text_with_verified_icon.dart';

class GMBrandCard extends StatelessWidget {
  const GMBrandCard({super.key, this.onTap, required this.showBorder});

  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = GMHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,

      /// Container Design
      child: GMRoundedContainer(
        padding: const EdgeInsets.all(GSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// -- Icon
            Flexible(
              child: GMCircularImage(
                isNetworkImage: false,
                image: GMImages.clothIcon,
                backgroundColor: Colors.transparent,
                overlayColor: isDark ? GMColors.white : GMColors.black,
              ),
            ),
            const SizedBox(width: GSizes.spaceBtwItems / 2),

            /// -- Text
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const GMBrandTitleWithVerifiedIcon(
                    title: "Atelier Mbadinga",
                    brandTextSize: TextSizes.large,
                  ),
                  Text(
                    "Libreville — Menuiserie",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final List<Map<String, dynamic>> gmBrands = [
  {
    "name": "Atelier Mbadinga",
    "image": GMImages.clothIcon,
    "location": "Libreville",
    "speciality": "Menuiserie",
    "isVerified": true,
  },
  {
    "name": "Atelier Mvoula",
    "image": GMImages.clothIcon,
    "location": "Port-Gentil",
    "speciality": "Menuiserie",
    "isVerified": false,
  },
  {
    "name": "Atelier Ngoma",
    "image": GMImages.clothIcon,
    "location": "Franceville",
    "speciality": "Menuiserie",
    "isVerified": true,
  },
];
