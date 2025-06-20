import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/common/widgets/appbar/appbar.dart';
import 'package:gabon_meuble_app/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:gabon_meuble_app/common/widgets/icons/gm_circular_icon.dart';
import 'package:gabon_meuble_app/common/widgets/images/gm_rounded_image.dart';
import 'package:gabon_meuble_app/utils/constants/colors.dart';
import 'package:gabon_meuble_app/utils/constants/image_strings.dart';
import 'package:gabon_meuble_app/utils/constants/sizes.dart';
import 'package:gabon_meuble_app/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class GMProductImageSlider extends StatelessWidget {
  const GMProductImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = GMHelperFunctions.isDarkMode(context);
    return GMCurvedEdgeWidget(
      child: Container(
        color: dark ? GMColors.darkGrey : GMColors.light,
        child: Stack(
          children: [
            /// Main Large Image
            const SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(GSizes.productImageRadius * 2),
                child: Center(
                  child: Image(image: AssetImage(GMImages.productImage5)),
                ),
              ),
            ),

            /// Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: GSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: 8,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder:
                      (_, __) => const SizedBox(width: GSizes.spaceBtwItems),
                  itemBuilder:
                      (_, index) => GMRoundedImage(
                        width: 80,
                        backgroundColor: dark ? GMColors.dark : GMColors.white,
                        border: Border.all(color: GMColors.primary),
                        padding: const EdgeInsets.all(GSizes.sm),
                        imageUrl: GMImages.productImage3,
                      ),
                ),
              ),
            ),

            /// AppBar Icon
            GMAppBar(
              showBackArrow: true,
              actions: [
                GMCircularIcon(icon: Iconsax.heart5, color: Colors.red),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
