import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class GMRatingAndShare extends StatelessWidget {
  const GMRatingAndShare({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(Iconsax.star5, color: Colors.amber, size: 24),
            SizedBox(width: GSizes.spaceBtwItems / 2),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "5.0",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const TextSpan(text: "(190)"),
                ],
              ),
            ),
          ],
        ),

        /// Share Button
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.share, size: GSizes.iconMd),
        ),
      ],
    );
  }
}
