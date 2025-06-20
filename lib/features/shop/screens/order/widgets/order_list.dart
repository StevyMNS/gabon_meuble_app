import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:gabon_meuble_app/utils/constants/colors.dart';
import 'package:gabon_meuble_app/utils/constants/sizes.dart';
import 'package:gabon_meuble_app/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class GMOrderListItems extends StatelessWidget {
  const GMOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = GMHelperFunctions.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 5,
      separatorBuilder:
          (context, index) => const SizedBox(height: GSizes.spaceBtwItems),
      itemBuilder:
          (_, index) => GMRoundedContainer(
            showBorder: true,
            padding: const EdgeInsets.all(GSizes.md),
            backgroundColor: dark ? GMColors.dark : GMColors.light,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// -- Row 1
                Row(
                  children: [
                    /// 1 - Icon
                    const Icon(Iconsax.ship),
                    const SizedBox(width: GSizes.spaceBtwItems / 2),

                    // 2 - Status & Date
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Processing",
                            style: Theme.of(context).textTheme.bodyLarge!.apply(
                              color: GMColors.primary,
                              fontWeightDelta: 1,
                            ),
                          ),
                          Text(
                            "07 Nov 2024",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ],
                      ),
                    ),

                    /// 3 - Icon
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Iconsax.arrow_right_34,
                        size: GSizes.iconSm,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: GSizes.spaceBtwItems),

                /// -- Row 2
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          /// 1 - Icon
                          const Icon(Iconsax.tag),
                          const SizedBox(width: GSizes.spaceBtwItems / 2),

                          // 2 - Status & Date
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Order",
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                ),
                                Text(
                                  "[#256f2]",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    Expanded(
                      child: Row(
                        children: [
                          /// 1 - Icon
                          const Icon(Iconsax.calendar),
                          const SizedBox(width: GSizes.spaceBtwItems / 2),

                          // 2 - Status & Date
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Shipping Date",
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                ),
                                Text(
                                  "03 Feb 2025",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
    );
  }
}
