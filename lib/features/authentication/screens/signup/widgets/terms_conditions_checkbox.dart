import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/features/authentication/controllers/singup/signup_controller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class GMTermsAndConditionsCheckbox extends StatelessWidget {
  const GMTermsAndConditionsCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final dark = GMHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(
            () => Checkbox(
              value: controller.privacyPolicy.value,
              onChanged:
                  (value) =>
                      controller.privacyPolicy.value =
                          !controller.privacyPolicy.value,
            ),
          ),
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
