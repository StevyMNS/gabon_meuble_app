import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/devices/device_utility.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class OnBoardingDotNavigator extends StatelessWidget {
  const OnBoardingDotNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = GMHelperFunctions.isDarkMode(context);

    return Positioned(
      bottom: GMDeviceUtils.getBottomNavigationBarHeight() + 25,
      left: GSizes.defaultSpace,
      child: SmoothPageIndicator(
        count: 3,
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        effect: ExpandingDotsEffect(
          activeDotColor: dark ? GMColors.light : GMColors.dark,
          dotHeight: 6,
        ),
      ),
    );
  }
}
