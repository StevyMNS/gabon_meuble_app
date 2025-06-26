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
          /// Champ texte
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: "Vous avez un code promo ? Entrez-le ici",
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),

          /// Bouton appliquer
          SizedBox(
            width: 80,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor:
                    dark
                        ? GMColors.white.withAlpha(120)
                        : GMColors.dark.withAlpha(120),
                backgroundColor: Colors.grey.withAlpha(40),
                side: BorderSide(color: Colors.grey.withAlpha(30)),
              ),
              child: const Text("Appliquer"),
            ),
          ),
        ],
      ),
    );
  }
}
