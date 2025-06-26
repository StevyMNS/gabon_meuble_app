import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:gabon_meuble_app/features/authentication/screens/login/login.dart';
import 'package:gabon_meuble_app/features/authentication/screens/onboarding/onboarding.dart';
import 'package:gabon_meuble_app/features/authentication/screens/verify_email.dart';
import 'package:gabon_meuble_app/navigation_menu.dart';
import 'package:gabon_meuble_app/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:gabon_meuble_app/utils/exceptions/firebase_exceptions.dart';
import 'package:gabon_meuble_app/utils/exceptions/format_exceptions.dart';
import 'package:gabon_meuble_app/utils/exceptions/platform_exceptions.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepositoriy extends GetxController {
  static AuthenticationRepositoriy get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  /// Called from main.dart on app lunch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  /// Function to Show Relevant Screen
  screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      /// local Storage
      deviceStorage.writeIfNull("isFirstTime", true);

      /// check if it's the first time the app is launched
      deviceStorage.read("isFirstTime") != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(() => const OnBoardingScreen());
    }
  }

  /* -------------------------  Email & Password sign-in ------------------------- */

  /// [EmailAuthentication] - Login
  Future<UserCredential> loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw GMFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw GMFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const GMFormatException();
    } on PlatformException catch (e) {
      throw GMPlatformException(e.code).message;
    } catch (e) {
      throw 'Une erreur est survenue. Veuillez réessayer.';
    }
  }

  /// [EmailAuthentication] - Register
  Future<UserCredential> registerWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw GMFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw GMFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const GMFormatException();
    } on PlatformException catch (e) {
      throw GMPlatformException(e.code).message;
    } catch (e) {
      throw 'Une erreur est survenue. Veuillez réessayer.';
    }
  }

  /// [EmailVerification] - MAIL VERIFICATION
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw GMFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw GMFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const GMFormatException();
    } on PlatformException catch (e) {
      throw GMPlatformException(e.code).message;
    } catch (e) {
      throw 'Une erreur est survenue. Veuillez réessayer.';
    }
  }

  /// [LogoutUser] - Valid for any authentification
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw GMFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw GMFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const GMFormatException();
    } on PlatformException catch (e) {
      throw GMPlatformException(e.code).message;
    } catch (e) {
      throw 'Une erreur est survenue. Veuillez réessayer.';
    }
  }
}
