import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/features/authentication/screens/signup/widgets/terms_conditions_checkbox.dart';
import 'package:gabon_meuble_app/features/authentication/screens/verify_email.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class GMSignupForm extends StatelessWidget {
  const GMSignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: GMTextStrings.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              const SizedBox(width: GSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: GMTextStrings.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: GSizes.spaceBtwInputFields),

          /// Username
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
              labelText: GMTextStrings.username,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),
          const SizedBox(height: GSizes.spaceBtwInputFields),

          /// Email
          TextFormField(
            decoration: const InputDecoration(
              labelText: GMTextStrings.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),
          const SizedBox(height: GSizes.spaceBtwInputFields),

          /// Phone Number
          TextFormField(
            decoration: const InputDecoration(
              labelText: GMTextStrings.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          const SizedBox(height: GSizes.spaceBtwInputFields),

          /// Password
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              labelText: GMTextStrings.password,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
          ),
          const SizedBox(height: GSizes.spaceBtwInputFields),

          /// Terms and Conditions Checkbox
          const GMTermsAndConditionsCheckbox(),
          const SizedBox(height: GSizes.spaceBtwSections),

          /// Sign Up Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Get.to(() => const VerifyEmailScreen()),
              child: const Text(GMTextStrings.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
