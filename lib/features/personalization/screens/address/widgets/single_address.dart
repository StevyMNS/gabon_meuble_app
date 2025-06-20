import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:gabon_meuble_app/utils/constants/colors.dart';
import 'package:gabon_meuble_app/utils/constants/sizes.dart';
import 'package:gabon_meuble_app/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class GMSingleAddress extends StatelessWidget {
  const GMSingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = GMHelperFunctions.isDarkMode(context);
    return GMRoundedContainer(
      showBorder: true,
      padding: const EdgeInsets.all(GSizes.md),
      width: double.infinity,
      backgroundColor:
          selectedAddress
              ? GMColors.primary.withValues(alpha: 0.5)
              : Colors.transparent,
      borderColor:
          selectedAddress
              ? Colors.transparent
              : dark
              ? GMColors.darkerGrey
              : GMColors.grey,
      margin: EdgeInsets.only(bottom: GSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle5 : null,
              color:
                  selectedAddress
                      ? dark
                          ? GMColors.light
                          : GMColors.dark
                      : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "John Doe",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: GSizes.sm / 2),
              const Text(
                "(+241) 456 7898",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: GSizes.sm / 2),
              const Text(
                "82356 Timmy Coves, South Liana, Maine, 87665, USA",
                softWrap: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
