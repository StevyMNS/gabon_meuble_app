import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:gabon_meuble_app/common/widgets/success_screen/success_screen.dart';
import 'package:gabon_meuble_app/data/repositories/authentification/authentication_repositoriy.dart';
import 'package:gabon_meuble_app/utils/constants/image_strings.dart';
import 'package:gabon_meuble_app/utils/constants/text_strings.dart';
import 'package:gabon_meuble_app/utils/popups/loaders.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  /// Send Email whenever verify Screen appears & set timer for auto readirect
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  /// Send Email Verification Link
  sendEmailVerification() async {
    try {
      await AuthenticationRepositoriy.instance.sendEmailVerification();
      GMLoaders.successSnackBar(
        title: "Email Sent",
        message: "Please check your inbox and verify your email.",
      );
    } catch (e) {
      GMLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  /// Timer to automatically redirect on Email Verification
  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(
          () => SuccessScreen(
            image: GMImages.staticSuccessIllustration,
            title: GMTextStrings.yourAccountCreatedTitle,
            subTitle: GMTextStrings.yourAccountCreatedSubTitle,
            onPressed:
                () => AuthenticationRepositoriy.instance.screenRedirect(),
          ),
        );
      }
    });
  }

  /// Manuelly Check if Email is Verified
  checkEmailVerification() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(
        () => SuccessScreen(
          image: GMImages.staticSuccessIllustration,
          title: GMTextStrings.yourAccountCreatedTitle,
          subTitle: GMTextStrings.yourAccountCreatedSubTitle,
          onPressed: () => AuthenticationRepositoriy.instance.screenRedirect(),
        ),
      );
    }
  }
}
