import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/features/authentication/screens/login/widgets/login_form.dart';
import 'package:gabon_meuble_app/features/authentication/screens/login/widgets/login_header.dart';
import 'package:gabon_meuble_app/utils/constants/sizes.dart';
import 'package:gabon_meuble_app/utils/constants/text_strings.dart';
import 'package:get/get.dart';
import '../../../../../common/styles/spacing_styles.dart';
import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: GMSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// Logo, Title et sub title
              const GMLoginHeader(),

              /// Form
              const GMLoginForm(),

              /// Divider
              GMFormDivider(
                dividerText: GMTextStrings.orSignInWith.capitalize!,
              ),
              const SizedBox(height: GSizes.spaceBtwSections),

              /// Footer
              const GMSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
