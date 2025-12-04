import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:gabon_meuble_app/data/repositories/user/user_model.dart';
import 'package:gabon_meuble_app/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:gabon_meuble_app/utils/exceptions/format_exceptions.dart';
import 'package:gabon_meuble_app/utils/exceptions/platform_exceptions.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Function to save user data in Firestore
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on GMFirebaseAuthException catch (e) {
      throw GMFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw const GMFormatException();
    } on PlatformException catch (e) {
      throw GMPlatformException(e.code).message;
    } catch (e) {
      throw 'Une erreur est survenue. Veuillez réessayer.';
    }
  }
}
