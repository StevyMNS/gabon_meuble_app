import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/devices/device_utility.dart';
import '../../../../utils/helpers/helper_functions.dart';

class GMSearchContainer extends StatelessWidget {
  const GMSearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: GSizes.defaultSpace),
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final dark = GMHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: GMDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(GSizes.md),
          decoration: BoxDecoration(
            color:
                showBackground
                    ? dark
                        ? GMColors.dark
                        : GMColors.light
                    : Colors.transparent,
            borderRadius: BorderRadius.circular(GSizes.cardRadiusLg),
            border: showBorder ? Border.all(color: GMColors.grey) : null,
          ),
          child: /*TextField(
            decoration: InputDecoration(
              hintText: 'Rechercher un artisan ou un produit',
              filled: true,
              fillColor: Colors.white,
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
          ) */ Row(
            children: [
              Icon(icon, color: dark ? GMColors.darkGrey : GMColors.grey),
              const SizedBox(width: GSizes.spaceBtwItems),
              Text(text, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}
