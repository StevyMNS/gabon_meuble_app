import 'package:flutter/widgets.dart';
import 'package:gabon_meuble_app/data/repositories/authentification/authentication_repositoriy.dart';
import 'package:gabon_meuble_app/utils/constants/image_strings.dart';
import 'package:gabon_meuble_app/utils/helpers/network_manager.dart';
import 'package:gabon_meuble_app/utils/popups/full_screen_loader.dart';
import 'package:gabon_meuble_app/utils/popups/loaders.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  /// Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  /*@override
  void onInit() {
    email.text = localStorage.read("REMEMBER_ME_EMAIL");
    password.text = localStorage.read("REMEMBER_ME_PASSWORD");
    super.onInit();
  } */

  /// Email & Password Sign-in
  Future<void> emailAndPasswordSignIn() async {
    try {
      // Start Loading
      GMFullScreenLoader.openLoadingDialog(
        "Connexion en cours",
        GMImages.docerAnimation,
      );

      ///await Future.delayed(const Duration(seconds: 2)); // 🔍 Test visuel

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        GMFullScreenLoader.stopLoading();
        GMLoaders.errorSnackBar(
          title: "Pas de connexion",
          message: "Veuillez vérifier votre connexion Internet.",
        );
        return;
      }

      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        GMFullScreenLoader.stopLoading();
        return;
      }

      // Save Data if Remember Me is checked
      if (rememberMe.value) {
        localStorage.write("REMEMBER_ME_EMAIL", email.text.trim());
        localStorage.write("REMEMBER_ME_PASSWORD", password.text.trim());
      }

      // Login user using Email & Password Authentication
      final userCredentials = await AuthenticationRepositoriy.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Remove Loader
      GMFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepositoriy.instance.screenRedirect();
    } catch (e) {
      GMFullScreenLoader.stopLoading();
      GMLoaders.errorSnackBar(title: "Oh snap!", message: e.toString());
    }
  }
}
