import 'package:flutter/material.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';

class GMHomeAppBar extends StatelessWidget {
  const GMHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GMAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            GMTextStrings.homeAppbarTitle,
            style: Theme.of(
              context,
            ).textTheme.labelMedium!.apply(color: GMColors.grey),
          ),
          Text(
            GMTextStrings.homeAppbarSubTitle,
            style: Theme.of(
              context,
            ).textTheme.labelMedium!.apply(color: GMColors.white),
          ),
        ],
      ),
      actions: [GMCartCounterIcon(onPressed: () {}, iconColor: GMColors.white)],
    );
  }
}
