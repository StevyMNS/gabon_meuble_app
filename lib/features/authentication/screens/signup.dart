import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/common/widgets/login_signup/form_divider.dart';
import 'package:gabon_meuble_app/common/widgets/login_signup/social_buttons.dart';
import 'package:gabon_meuble_app/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:gabon_meuble_app/utils/constants/sizes.dart';
import 'package:gabon_meuble_app/utils/constants/text_strings.dart';
import 'package:get/get.dart';


class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(GSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                GMTextStrings.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: GSizes.spaceBtwSections),

              /// Form
              const GMSignupForm(),
              const SizedBox(height: GSizes.spaceBtwSections),

              /// Divider
              GMFormDivider(
                dividerText: GMTextStrings.orSignUpWith.capitalize!,
              ),
              const SizedBox(height: GSizes.spaceBtwSections),

              /// Social Buttons
              const GMSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}


