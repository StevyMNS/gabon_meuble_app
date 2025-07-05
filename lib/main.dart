import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:gabon_meuble_app/data/local_db/local_db.dart';
import 'package:gabon_meuble_app/data/repositories/authentification/authentication_repositoriy.dart';
import 'package:gabon_meuble_app/firebase_options.dart';
import 'package:gabon_meuble_app/utils/helpers/network_manager.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'myapp.dart';

void main() async {
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  LocalDB.initDemoData();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((FirebaseApp value) {
    Get.put(AuthenticationRepositoriy());
    Get.put(NetworkManager());
  });
  //runApp(DevicePreview(builder: (context) => MyApp()));
  runApp(MyApp());
}
