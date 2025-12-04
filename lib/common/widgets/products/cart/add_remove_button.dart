import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/common/widgets/icons/gm_circular_icon.dart';
import 'package:gabon_meuble_app/utils/constants/colors.dart';
import 'package:gabon_meuble_app/utils/constants/sizes.dart';
import 'package:gabon_meuble_app/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class GMProductQuantityWithAddRemoveButton extends StatelessWidget {
  const GMProductQuantityWithAddRemoveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GMCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: GSizes.md,
          color:
              GMHelperFunctions.isDarkMode(context)
                  ? GMColors.white
                  : GMColors.black,
          backgroundColor:
              GMHelperFunctions.isDarkMode(context)
                  ? GMColors.darkerGrey
                  : GMColors.light,
        ),
        const SizedBox(width: GSizes.spaceBtwItems),
        Text("2", style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: GSizes.spaceBtwItems),

        GMCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: GSizes.md,
          color: GMColors.white,
          backgroundColor: GMColors.primary,
        ),
      ],
    );
  }
}
