import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:gabon_meuble_app/utils/constants/colors.dart';
import 'package:gabon_meuble_app/utils/constants/sizes.dart';
import 'package:gabon_meuble_app/utils/helpers/helper_functions.dart';

class GMCouponCode extends StatelessWidget {
  const GMCouponCode({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = GMHelperFunctions.isDarkMode(context);
    return GMRoundedContainer(
      showBorder: true,
      backgroundColor: dark ? GMColors.dark : GMColors.white,
      padding: const EdgeInsets.only(
        top: GSizes.sm,
        bottom: GSizes.sm,
        right: GSizes.sm,
        left: GSizes.md,
      ),
      child: Row(
        children: [
          /// TextField
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: "Have a promo code? Enter here",
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),

          /// Button
          SizedBox(
            width: 80,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor:
                    dark
                        ? GMColors.white.withValues(alpha: 0.5)
                        : GMColors.dark.withValues(alpha: 0.5),
                backgroundColor: Colors.grey.withValues(alpha: 0.2),
                side: BorderSide(color: Colors.grey.withValues(alpha: 0.1)),
              ),
              child: const Text("Apply"),
            ),
          ),
        ],
      ),
    );
  }
}
