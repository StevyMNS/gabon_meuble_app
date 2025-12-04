import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/utils/devices/device_utility.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';

class GMTabBar extends StatelessWidget implements PreferredSizeWidget {
  const GMTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = GMHelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? GMColors.black : GMColors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: GMColors.primary,
        labelColor: dark ? GMColors.white : GMColors.primary,
        unselectedLabelColor: GMColors.darkerGrey,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(GMDeviceUtils.getAppBarHeight());
}
