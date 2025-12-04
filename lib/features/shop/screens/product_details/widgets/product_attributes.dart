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
                            title: "Prix :",
                            smallSize: true,
                          ),

                          /// Actual Price
                          Text(
                            "5000 F",
                            style: Theme.of(context).textTheme.bodySmall!.apply(
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          const SizedBox(width: GSizes.spaceBtwItems / 2),

                          /// Sale Price
                          const GMProductPriceText(price: "1.2M"),
                        ],
                      ),
                      Row(
                        children: [
                          const GMProductTitleText(
                            title: "Stock :",
                            smallSize: true,
                          ),
                          Text(
                            "En Stock",
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
                title: "Grand Portail vert avec motif doré",
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
            const GMSectionHeading(title: "Coleur", showActionButton: false),
            const SizedBox(height: GSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                GMChoiceChip(
                  text: "Vert",
                  selected: true,
                  onSelected: (value) {},
                ),
                GMChoiceChip(
                  text: "Bleu",
                  selected: false,
                  onSelected: (value) {},
                ),
                GMChoiceChip(
                  text: "Jaune",
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
            const GMSectionHeading(title: "Taille", showActionButton: false),
            const SizedBox(height: GSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                GMChoiceChip(
                  text: "2m",
                  selected: true,
                  onSelected: (value) {},
                ),
                GMChoiceChip(
                  text: "3m",
                  selected: false,
                  onSelected: (value) {},
                ),
                GMChoiceChip(
                  text: "4m",
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
