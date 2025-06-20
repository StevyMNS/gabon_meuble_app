import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/utils/constants/sizes.dart';

import '../../constants/colors.dart';

class GMAppBarTheme {
  GMAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: GMColors.black, size: GSizes.iconMd),
    actionsIconTheme: IconThemeData(color: GMColors.black, size: GSizes.iconMd),
    titleTextStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: GMColors.black,
    ),
  );

  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: GMColors.black, size: GSizes.iconMd),
    actionsIconTheme: IconThemeData(color: GMColors.white, size: GSizes.iconMd),
    titleTextStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: GMColors.white,
    ),
  );
}
