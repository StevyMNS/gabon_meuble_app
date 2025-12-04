import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/common/widgets/texts/section_heading.dart';
import 'package:gabon_meuble_app/utils/constants/sizes.dart';

class GMBillingAddressSection extends StatelessWidget {
  const GMBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GMSectionHeading(
          title: "Adresse de livraison",
          buttonTitle: "Modifier",
          onPressed: () {},
        ),
        Text("Jean Doe", style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: GSizes.spaceBtwItems / 2),

        Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey, size: 16),
            const SizedBox(width: GSizes.spaceBtwItems),
            Text(
              "+241 06 00 00 000",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        const SizedBox(height: GSizes.spaceBtwItems / 2),

        Row(
          children: [
            const Icon(
              Icons.location_on_outlined,
              color: Colors.grey,
              size: 16,
            ),
            const SizedBox(width: GSizes.spaceBtwItems),
            Expanded(
              child: Text(
                "Angondjé, Libreville, Gabon",
                style: Theme.of(context).textTheme.bodyMedium,
                softWrap: true,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
