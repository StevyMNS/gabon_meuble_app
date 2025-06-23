import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/features/authentication/controllers/singup/signup_controller.dart';
import 'package:gabon_meuble_app/features/authentication/screens/signup/widgets/terms_conditions_checkbox.dart';
import 'package:gabon_meuble_app/utils/validators/validation.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class GMSignupForm extends StatelessWidget {
  const GMSignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          /// First Name and Last Name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator:
                      (value) =>
                          GMValidator.validateEmptyText("First name", value),
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
                  controller: controller.lastName,
                  validator:
                      (value) =>
                          GMValidator.validateEmptyText("Last name", value),
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
            controller: controller.userName,
            validator:
                (value) => GMValidator.validateEmptyText("Username", value),
            expands: false,
            decoration: const InputDecoration(
              labelText: GMTextStrings.username,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),
          const SizedBox(height: GSizes.spaceBtwInputFields),

          /// Email
          TextFormField(
            validator: (value) => GMValidator.validateEmail(value),
            controller: controller.email,
            decoration: const InputDecoration(
              labelText: GMTextStrings.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),
          const SizedBox(height: GSizes.spaceBtwInputFields),

          /// Phone Number
          TextFormField(
            validator: (value) => GMValidator.validatePhoneNumber(value),
            controller: controller.phoneNumber,
            decoration: const InputDecoration(
              labelText: GMTextStrings.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          const SizedBox(height: GSizes.spaceBtwInputFields),

          /// Password
          Obx(
            () => TextFormField(
              validator: (value) => GMValidator.validatePassword(value),
              controller: controller.password,
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                labelText: GMTextStrings.password,
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  onPressed:
                      () =>
                          controller.hidePassword.value =
                              !controller.hidePassword.value,
                  icon: Icon(
                    controller.hidePassword.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye,
                  ),
                ),
              ),
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
              onPressed: () => controller.signup(),
              child: const Text(GMTextStrings.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
