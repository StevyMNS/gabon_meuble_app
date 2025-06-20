import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/common/widgets/icons/gm_circular_icon.dart';
import 'package:gabon_meuble_app/utils/constants/colors.dart';
import 'package:gabon_meuble_app/utils/constants/sizes.dart';
import 'package:gabon_meuble_app/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class GMBottomAddToCart extends StatelessWidget {
  const GMBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = GMHelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: GSizes.defaultSpace,
        vertical: GSizes.defaultSpace / 2,
      ),
      decoration: BoxDecoration(
        color: dark ? GMColors.darkGrey : GMColors.light,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(GSizes.cardRadiusLg),
          topRight: Radius.circular(GSizes.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const GMCircularIcon(
                icon: Iconsax.minus,
                backgroundColor: GMColors.darkGrey,
                width: 40,
                height: 40,
                color: GMColors.white,
              ),
              const SizedBox(width: GSizes.spaceBtwItems),
              Text("2", style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(width: GSizes.spaceBtwItems),
              const GMCircularIcon(
                icon: Iconsax.add,
                backgroundColor: GMColors.black,
                width: 40,
                height: 40,
                color: GMColors.white,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(GSizes.md),
              backgroundColor: GMColors.black,
              side: const BorderSide(color: GMColors.black),
            ),
            child: const Text("Add to Cart"),
          ),
        ],
      ),
    );
  }
}
