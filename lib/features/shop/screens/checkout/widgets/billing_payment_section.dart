import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:gabon_meuble_app/common/widgets/texts/section_heading.dart';
import 'package:gabon_meuble_app/utils/constants/colors.dart';
import 'package:gabon_meuble_app/utils/constants/image_strings.dart';
import 'package:gabon_meuble_app/utils/constants/sizes.dart';
import 'package:gabon_meuble_app/utils/helpers/helper_functions.dart';

class GMBillingPaymentSection extends StatelessWidget {
  const GMBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = GMHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        GMSectionHeading(
          title: "Moyen de paiement",
          buttonTitle: "Modifier",
          onPressed: () {},
        ),
        const SizedBox(height: GSizes.spaceBtwItems / 2),
        Row(
          children: [
            GMRoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: dark ? GMColors.light : GMColors.white,
              padding: const EdgeInsets.all(2),
              child: const Image(
                image: AssetImage(GMImages.airtel),
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: GSizes.spaceBtwItems / 2),
            Text("Airtel Money", style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ],
    );
  }
}
