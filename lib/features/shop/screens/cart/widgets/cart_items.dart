import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/common/widgets/products/cart/add_remove_button.dart';
import 'package:gabon_meuble_app/common/widgets/products/cart/cart_item.dart';
import 'package:gabon_meuble_app/common/widgets/products/products_price/product_price_text.dart';
import 'package:gabon_meuble_app/utils/constants/sizes.dart';

class GMCartItems extends StatelessWidget {
  const GMCartItems({super.key, this.showAddRemoveButtons = true});

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 2,
      separatorBuilder:
          (_, __) => const SizedBox(height: GSizes.spaceBtwSections),
      itemBuilder:
          (_, index) => Column(
            children: [
              /// Cart Item
              const GMCartItem(),
              if (showAddRemoveButtons)
                const SizedBox(height: GSizes.spaceBtwItems),

              /// Add Remove Button Row with total Price
              if (showAddRemoveButtons)
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        /// Extra Space
                        SizedBox(width: 70),

                        /// Add Remove Buttons
                        GMProductQuantityWithAddRemoveButton(),
                      ],
                    ),
                    GMProductPriceText(price: "256"),
                  ],
                ),
            ],
          ),
    );
  }
}
