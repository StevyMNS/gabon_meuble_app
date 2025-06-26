import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/utils/constants/sizes.dart';

class GMBillingAmountSection extends StatelessWidget {
  const GMBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Sous-total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Sous-total", style: Theme.of(context).textTheme.bodyMedium),
            Text("256 FCFA", style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: GSizes.spaceBtwItems / 2),

        /// Frais de livraison
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Frais de livraison",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text("6 FCFA", style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: GSizes.spaceBtwItems / 2),

        /// Taxes
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Taxes", style: Theme.of(context).textTheme.bodyMedium),
            Text("6 FCFA", style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: GSizes.spaceBtwItems / 2),

        /// Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Total à payer",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text("268 FCFA", style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ],
    );
  }
}
