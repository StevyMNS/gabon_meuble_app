import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class GMVerticalImageText extends StatelessWidget {
  const GMVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = Colors.white,
    this.backgroundColor,
    this.onTape,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTape;

  @override
  Widget build(BuildContext context) {
    final dark = GMHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTape,
      child: Padding(
        padding: const EdgeInsets.only(right: GSizes.spaceBtwItems),
        child: Column(
          children: [
            /// Circular Icon
            Flexible(
              child: Container(
                width: 56,
                height: 56,
                //padding: const EdgeInsets.all(GSizes.sm),
                decoration: BoxDecoration(
                  color:
                      backgroundColor ??
                      (dark ? GMColors.dark : GMColors.white),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image(
                    image: AssetImage(image),
                    fit: BoxFit.cover,

                    ///color: dark ? GMColors.light : GMColors.dark,
                  ),
                ),
              ),
            ),

            /// Text
            const SizedBox(height: GSizes.spaceBtwItems / 2),
            SizedBox(
              width: 55,
              child: Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.labelMedium!.apply(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
