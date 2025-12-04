import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class GMShadowStyle {

  static final verticalProductShadow = BoxShadow(
    color: GMColors.darkGrey.withValues(alpha: 0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );


  static final horizontalProductShadow = BoxShadow(
    color: GMColors.darkGrey.withValues(alpha: 0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(2, 0),
  );
}