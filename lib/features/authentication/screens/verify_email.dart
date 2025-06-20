import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/features/authentication/screens/login/login.dart';
import 'package:gabon_meuble_app/utils/constants/text_strings.dart';
import 'package:gabon_meuble_app/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

import '../../../common/widgets/success_screen/success_screen.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.offAll(() => const LoginScreen()),
            icon: const Icon(CupertinoIcons.clear),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(GSizes.defaultSpace),
          child: Column(
            children: [
              /// Image
              Image(
                image: const AssetImage(GMImages.deliveredEmailIllustration),
                width: GMHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: GSizes.spaceBtwSections),

              /// Title & SubTitle
              Text(
                GMTextStrings.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: GSizes.spaceBtwItems),
              Text(
                "salvadorstevy@gmail.com",
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: GSizes.spaceBtwItems),
              Text(
                GMTextStrings.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: GSizes.spaceBtwSections),

              /// Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed:
                      () => Get.to(
                        () => SuccessScreen(
                          image: GMImages.staticSuccessIllustration,
                          title: GMTextStrings.yourAccountCreatedTitle,
                          subTitle: GMTextStrings.yourAccountCreatedSubTitle,
                          onPressed: () => Get.to(() => const LoginScreen()),
                        ),
                      ),
                  child: const Text(GMTextStrings.tContinue),
                ),
              ),
              const SizedBox(height: GSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(GMTextStrings.resendEmail),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
