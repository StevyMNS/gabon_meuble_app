import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:gabon_meuble_app/navigation_menu.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../signup.dart';

class GMLoginForm extends StatelessWidget {
  const GMLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: GSizes.spaceBtwSections),
        child: Column(
          children: [
            /// Email
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: GMTextStrings.email,
              ),
            ),
            const SizedBox(height: GSizes.spaceBtwInputFields),

            /// Password
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: GMTextStrings.password,
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
            const SizedBox(height: GSizes.spaceBtwInputFields / 2),

            /// Remember Me & Forgot Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Remember Me
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text(GMTextStrings.rememberMe),
                  ],
                ),

                /// Forgot Password
                Flexible(
                  child: TextButton(
                    onPressed: () => Get.to(() => const ForgetPassword()),
                    child: const Text(GMTextStrings.forgetPassword),
                  ),
                ),
              ],
            ),
            const SizedBox(height: GSizes.spaceBtwSections),

            /// Sign In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(() => const NavigationMenu()),
                child: const Text(GMTextStrings.signIn),
              ),
            ),
            const SizedBox(height: GSizes.spaceBtwItems),

            /// Create Account Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(() => const SignupScreen()),
                child: const Text(GMTextStrings.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
