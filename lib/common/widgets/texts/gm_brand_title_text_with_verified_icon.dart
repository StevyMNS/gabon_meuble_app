import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/common/widgets/texts/gm_brand_title_text.dart';
import 'package:gabon_meuble_app/utils/constants/enums.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class GMBrandTitleWithVerifiedIcon extends StatelessWidget {
  const GMBrandTitleWithVerifiedIcon({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.textColor,
    this.iconColor = GMColors.primary,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: GMBrandTitleText(
            title: title,
            color: textColor,
            maxLines: maxLines,
            textAlign: textAlign,
            brandTextSize: brandTextSize,
          ),
        ),
        const SizedBox(width: GSizes.xs),
        const Icon(
          Iconsax.verify5,
          color: GMColors.primary,
          size: GSizes.iconXs,
        ),
      ],
    );
  }
}
