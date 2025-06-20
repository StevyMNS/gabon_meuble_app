import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/utils/helpers/helper_functions.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class GMCircularIcon extends StatelessWidget {
  const GMCircularIcon({
    super.key,
    required this.icon,
    this.width,
    this.height,
    this.size = GSizes.lg,
    this.onPressed,
    this.color,
    this.backgroundColor,
  });

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color:
            backgroundColor != null
                ? backgroundColor!
                : GMHelperFunctions.isDarkMode(context)
                ? GMColors.black.withValues(alpha: 0.9)
                : GMColors.white.withValues(alpha: 0.9),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, color: color, size: size),
      ),
    );
  }
}
