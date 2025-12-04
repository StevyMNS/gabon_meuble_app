import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/data/repositories/authentification/authentication_repositoriy.dart';
import 'package:gabon_meuble_app/data/repositories/user/user_model.dart';
import 'package:gabon_meuble_app/data/repositories/user/user_repository.dart';
import 'package:gabon_meuble_app/features/authentication/screens/verify_email.dart';
import 'package:gabon_meuble_app/utils/constants/image_strings.dart';
import 'package:gabon_meuble_app/utils/helpers/network_manager.dart';
import 'package:gabon_meuble_app/utils/popups/full_screen_loader.dart';
import 'package:gabon_meuble_app/utils/popups/loaders.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();
  SignupController();

  /// Variables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  /// -- SIGNUP
  void signup() async {
    try {
      // Start Loarding
      GMFullScreenLoader.openLoadingDialog(
        "We are processing your information...",
        GMImages.docerAnimation,
      );

      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        GMFullScreenLoader.stopLoading();
        return;
      }

      // Validate Form
      if (!signupFormKey.currentState!.validate()) {
        // Remove Loader
        GMFullScreenLoader.stopLoading();
        return;
      }

      // Privacy Policy Check
      if (!privacyPolicy.value) {
        GMLoaders.warningSnackBar(
          title: "Accept Privacy Policy",
          message: "Please accept the privacy policy to continue.",
        );
        return;
      }

      // Register User in the Firebase Authentication & Save user data in the Firebase
      final userCredential = await AuthenticationRepositoriy.instance
          .registerWithEmailAndPassword(
            email.text.trim(),
            password.text.trim(),
          );

      // Save Authenticated user data in the Firebase Firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        userName: userName.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: "",
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // Remove Loader
      GMFullScreenLoader.stopLoading();

      // Show Success Message
      GMLoaders.successSnackBar(
        title: "Congratulations",
        message: "Your account has been created! Verify email to continue.",
      );

      /// Move to Verify Email Screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      // Remove Loader
      GMFullScreenLoader.stopLoading();
      // Show some Generic Error to the user
      GMLoaders.errorSnackBar(title: "On Snap", message: e.toString());
    }
  }
}
