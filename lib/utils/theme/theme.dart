import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/utils/theme/custom_theme/appbar_theme.dart';
import 'package:gabon_meuble_app/utils/theme/custom_theme/bottom_sheet_theme.dart';
import 'package:gabon_meuble_app/utils/theme/custom_theme/checkbox_theme.dart';
import 'package:gabon_meuble_app/utils/theme/custom_theme/chip_theme.dart';
import 'package:gabon_meuble_app/utils/theme/custom_theme/outlined_button_theme.dart';
import 'package:gabon_meuble_app/utils/theme/custom_theme/text_field_theme.dart';
import 'package:gabon_meuble_app/utils/theme/custom_theme/text_theme.dart';

import 'custom_theme/elevated_button_theme.dart';

class GMAppTheme {
  GMAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Nunito',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    textTheme: GMTextTheme.lightTextTheme,
    chipTheme: GMChipTheme.lightChipTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: GMAppBarTheme.lightAppBarTheme,
    checkboxTheme: GMCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: GMBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: GMElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: GMOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: GMTextFormFieldTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Nunito',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    textTheme: GMTextTheme.darkTextTheme,
    chipTheme: GMChipTheme.darkChipTheme,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: GMAppBarTheme.darkAppBarTheme,
    checkboxTheme: GMCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: GMBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: GMElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: GMOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: GMTextFormFieldTheme.darkInputDecorationTheme,
  );
}
