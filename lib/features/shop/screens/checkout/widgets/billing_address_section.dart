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
          title: "Shipping Address",
          buttonTitle: "Change",
          onPressed: () {},
        ),
        Text("John Doe", style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: GSizes.spaceBtwItems / 2),

        Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey, size: 16),
            const SizedBox(width: GSizes.spaceBtwItems),
            Text(
              "+98-254-8059525",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: GSizes.spaceBtwItems / 2),
          ],
        ),
        const SizedBox(height: GSizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(Icons.location_history, color: Colors.grey, size: 16),
            const SizedBox(width: GSizes.spaceBtwItems),
            Expanded(
              child: Text(
                "South Liana, Maine 87695, USA",
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
