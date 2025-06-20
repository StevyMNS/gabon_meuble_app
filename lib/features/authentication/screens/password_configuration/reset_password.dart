import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/utils/constants/image_strings.dart';
import 'package:gabon_meuble_app/utils/constants/text_strings.dart';

import '../../../../utils/constants/sizes.dart';
import 'package:get/get.dart';

import '../../../../utils/helpers/helper_functions.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(CupertinoIcons.clear),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(GSizes.defaultSpace),
          child: Column(
            children: [
              /// Image
              Image(
                image: AssetImage(GMImages.deliveredEmailIllustration),
                width: GMHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: GSizes.spaceBtwSections),

              /// Title & SubTitle
              Text(
                GMTextStrings.changeYourPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: GSizes.spaceBtwItems),
              Text(
                GMTextStrings.changeYourPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: GSizes.spaceBtwSections),

              /// Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(GMTextStrings.done),
                ),
              ),
              const SizedBox(height: GSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
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
