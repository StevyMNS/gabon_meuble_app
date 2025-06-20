import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:gabon_meuble_app/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:gabon_meuble_app/features/authentication/screens/onboarding/widgets/onboarding_pages.dart';
import 'package:gabon_meuble_app/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:gabon_meuble_app/utils/constants/image_strings.dart';
import 'package:gabon_meuble_app/utils/constants/text_strings.dart';
import 'package:get/get.dart';

import '../../controllers/onboarding/onboarding_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              OnBoardingPage(
                image: GMImages.onBoardingImage1,
                title: GMTextStrings.onBoardingTitle1,
                subTitle: GMTextStrings.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: GMImages.onBoardingImage2,
                title: GMTextStrings.onBoardingTitle2,
                subTitle: GMTextStrings.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: GMImages.onBoardingImage3,
                title: GMTextStrings.onBoardingTitle3,
                subTitle: GMTextStrings.onBoardingSubTitle3,
              ),
            ],
          ),

          const OnBoardingSkip(),
          const OnBoardingDotNavigator(),
          OnBoardingNextButton(),
        ],
      ),
    );
  }
}
