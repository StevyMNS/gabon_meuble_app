import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class GMTermsAndConditionsCheckbox extends StatelessWidget {
  const GMTermsAndConditionsCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = GMHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(value: true, onChanged: (value) {}),
        ),
        const SizedBox(width: GSizes.spaceBtwItems),
        Flexible(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: GMTextStrings.iAgreeTo,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                TextSpan(
                  text: GMTextStrings.privacyPolicy,
                  style: Theme.of(context).textTheme.labelMedium!.apply(
                    color: dark ? GMColors.white : GMColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? GMColors.white : GMColors.primary,
                  ),
                ),
                TextSpan(
                  text: GMTextStrings.and,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                TextSpan(
                  text: GMTextStrings.termsOfUse,
                  style: Theme.of(context).textTheme.labelMedium!.apply(
                    color: dark ? GMColors.white : GMColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? GMColors.white : GMColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
