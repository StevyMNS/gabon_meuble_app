import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/common/widgets/appbar/appbar.dart';
import 'package:gabon_meuble_app/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:gabon_meuble_app/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:gabon_meuble_app/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:gabon_meuble_app/common/widgets/texts/section_heading.dart';
import 'package:gabon_meuble_app/features/personalization/screens/address/address.dart';
import 'package:gabon_meuble_app/features/personalization/screens/profile/profile.dart';
import 'package:gabon_meuble_app/features/shop/screens/order/order.dart';
import 'package:gabon_meuble_app/utils/constants/colors.dart';
import 'package:gabon_meuble_app/utils/constants/sizes.dart';
import 'package:gabon_meuble_app/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- Header
            GMPrimaryHeaderContainer(
              child: Column(
                children: [
                  GMAppBar(
                    title: Text(
                      "Account",
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium!.apply(color: GMColors.white),
                    ),
                  ),

                  /// User Profile Card
                  GMUserProfileTile(
                    onPressed: () => Get.to(() => const ProfileScreen()),
                  ),
                  const SizedBox(height: GSizes.spaceBtwSections),
                ],
              ),
            ),

            /// -- Body
            Padding(
              padding: const EdgeInsets.all(GSizes.defaultSpace),
              child: Column(
                children: [
                  /// Account Settings
                  const GMSectionHeading(
                    title: "Account Settings",
                    showActionButton: false,
                  ),
                  const SizedBox(height: GSizes.spaceBtwItems),

                  GMSettingsMenuTile(
                    icon: Iconsax.safe_home,
                    title: "My Address",
                    subtitle: "Set shopping delivery address",
                    onTap: () => Get.to(() => const UserAddressScreen()),
                  ),
                  const GMSettingsMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: "My Cart",
                    subtitle: "Add, remove products and move to checkout",
                  ),
                  GMSettingsMenuTile(
                    icon: Iconsax.bag_tick,
                    title: "My Orders",
                    subtitle: "In-progress and completed orders",
                    onTap: () => Get.to(() => const OrderScreen()),
                  ),
                  const GMSettingsMenuTile(
                    icon: Iconsax.bank,
                    title: "Bank Accounts",
                    subtitle: "Withdraw balance to registered bank accounts",
                  ),
                  const GMSettingsMenuTile(
                    icon: Iconsax.discount_shape,
                    title: "My Coupons",
                    subtitle: "List of all the discount coupons",
                  ),
                  const GMSettingsMenuTile(
                    icon: Iconsax.notification,
                    title: "Notifications",
                    subtitle: "Set any kind of notifications messages",
                  ),
                  const GMSettingsMenuTile(
                    icon: Iconsax.security_card,
                    title: "Account Privacy",
                    subtitle: "Manage data usage and connected accounts",
                  ),

                  /// -- App Settings
                  SizedBox(height: GSizes.spaceBtwSections),
                  GMSectionHeading(
                    title: "App Settings",
                    showActionButton: false,
                  ),
                  SizedBox(height: GSizes.spaceBtwItems),
                  GMSettingsMenuTile(
                    icon: Iconsax.document_upload,
                    title: "Load Data",
                    subtitle: "Upload Data to your Cloud Firebase",
                  ),
                  GMSettingsMenuTile(
                    icon: Iconsax.location,
                    title: "Geolocation",
                    subtitle: "Set recommendation based on location",
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  GMSettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: "Safe Mode",
                    subtitle: "Search result is safe for all ages",
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  GMSettingsMenuTile(
                    icon: Iconsax.image,
                    title: "HD Image Quality",
                    subtitle: "Set image quality to be seen",
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),

                  /// -- Logout Button
                  const SizedBox(height: GSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Text(
                        "Logout",
                        style: TextStyle(
                          color:
                              GMHelperFunctions.isDarkMode(context)
                                  ? GMColors.white
                                  : GMColors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: GSizes.spaceBtwSections * 2.5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
