import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/utils/constants/colors.dart';

class GMChipTheme {
  GMChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: GMColors.grey.withValues(alpha: 0.4),
    labelStyle: const TextStyle(color: GMColors.black),
    selectedColor: GMColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    checkmarkColor: GMColors.white,
  );

  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: GMColors.darkerGrey,
    labelStyle: TextStyle(color: GMColors.white),
    selectedColor: GMColors.primary,
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    checkmarkColor: GMColors.white,
  );
}
