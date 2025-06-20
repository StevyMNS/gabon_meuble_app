import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/common/widgets/chips/choice_chip.dart';
import 'package:gabon_meuble_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:gabon_meuble_app/common/widgets/products/products_price/product_price_text.dart';
import 'package:gabon_meuble_app/common/widgets/texts/product_title_text.dart';
import 'package:gabon_meuble_app/common/widgets/texts/section_heading.dart';
import 'package:gabon_meuble_app/utils/constants/colors.dart';
import 'package:gabon_meuble_app/utils/constants/sizes.dart';
import 'package:gabon_meuble_app/utils/helpers/helper_functions.dart';

class GMProductAttributes extends StatelessWidget {
  const GMProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = GMHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        /// -- Selected Attributes Pricing & Description
        GMRoundedContainer(
          padding: const EdgeInsets.all(GSizes.md),
          backgroundColor: dark ? GMColors.darkGrey : GMColors.grey,
          child: Column(
            children: [
              /// Title, Price and Stack Status
              Row(
                children: [
                  const GMSectionHeading(
                    title: "Variation",
                    showActionButton: false,
                  ),
                  const SizedBox(width: GSizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const GMProductTitleText(
                            title: "Price :",
                            smallSize: true,
                          ),

                          /// Actual Price
                          Text(
                            "\$25",
                            style: Theme.of(context).textTheme.titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(width: GSizes.spaceBtwItems),

                          /// Sale Price
                          const GMProductPriceText(price: "20"),
                        ],
                      ),
                      Row(
                        children: [
                          const GMProductTitleText(
                            title: "Stock :",
                            smallSize: true,
                          ),
                          Text(
                            "In Stock",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              /// Variation Description
              const GMProductTitleText(
                title:
                    "This is the description of product and it can go up to max 4 lines",
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),
        const SizedBox(height: GSizes.spaceBtwItems),

        /// --Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const GMSectionHeading(title: "Colors", showActionButton: false),
            const SizedBox(height: GSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                GMChoiceChip(
                  text: "Green",
                  selected: false,
                  onSelected: (value) {},
                ),
                GMChoiceChip(
                  text: "Blue",
                  selected: true,
                  onSelected: (value) {},
                ),
                GMChoiceChip(
                  text: "Yellow",
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const GMSectionHeading(title: "Size", showActionButton: false),
            const SizedBox(height: GSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                GMChoiceChip(
                  text: "EU 34",
                  selected: true,
                  onSelected: (value) {},
                ),
                GMChoiceChip(
                  text: "EU 36",
                  selected: false,
                  onSelected: (value) {},
                ),
                GMChoiceChip(
                  text: "EU 38",
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
