import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/features/personalization/screens/settings/settings.dart';
import 'package:gabon_meuble_app/features/shop/screens/messagerie/messagerie.dart';
import 'package:gabon_meuble_app/features/shop/screens/wishlist/wishlist.dart';
import 'package:gabon_meuble_app/utils/constants/colors.dart';
import 'package:gabon_meuble_app/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'features/shop/screens/home/home.dart';
import 'features/shop/screens/store/explorer.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = GMHelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected:
              (index) => controller.selectedIndex.value = index,
          backgroundColor: darkMode ? GMColors.black : Colors.white,
          indicatorColor:
              darkMode
                  ? GMColors.white.withValues(alpha: 0.1)
                  : GMColors.black.withValues(alpha: 0.1),

          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: "Accueil"),
            NavigationDestination(icon: Icon(Iconsax.shop), label: "Explorer"),
            NavigationDestination(
              icon: Icon(Iconsax.shopping_cart),
              label: "Commandes",
            ),
            NavigationDestination(
              icon: Icon(Iconsax.message),
              label: "Messages",
            ),
            NavigationDestination(icon: Icon(Iconsax.user), label: "Profil"),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const StoreScreen(),
    const FavouriteScreen(),
    const MessagesPage(),
    const SettingsScreen(),
  ];
}
