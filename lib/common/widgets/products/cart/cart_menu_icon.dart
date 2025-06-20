import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/features/shop/screens/cart/cart.dart';
import 'package:gabon_meuble_app/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';

class GMCartCounterIcon extends StatelessWidget {
  const GMCartCounterIcon({
    super.key,
    this.iconColor,
    this.counterBgColor,
    this.counterTextColor,
    required this.onPressed,
  });

  final Color? iconColor, counterBgColor, counterTextColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = GMHelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        IconButton(
          onPressed: () => Get.to(() => const CartScreen()),
          icon: Icon(Iconsax.shopping_bag, color: iconColor),
        ),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: counterBgColor ?? (dark ? GMColors.white : GMColors.black),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text(
                "2",
                style: Theme.of(
                  context,
                ).textTheme.labelLarge!.apply(color: GMColors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
