import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';

class GMSocialButtons extends StatelessWidget {
  const GMSocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: GMColors.grey),
            borderRadius: BorderRadius.circular(180),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              width: GSizes.iconMd,
              height: GSizes.iconMd,
              image: AssetImage(GMImages.google),
            ),
          ),
        ),
        const SizedBox(width: GSizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(
            color: GMColors.white,
            border: Border.all(color: GMColors.grey),
            borderRadius: BorderRadius.circular(180),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              width: GSizes.iconMd,
              height: GSizes.iconMd,
              image: AssetImage(GMImages.facebook),
            ),
          ),
        ),
      ],
    );
  }
}
