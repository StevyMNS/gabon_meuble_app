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
                      "Compte",
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
                    title: "Paramètres du compte",
                    showActionButton: false,
                  ),
                  const SizedBox(height: GSizes.spaceBtwItems),

                  GMSettingsMenuTile(
                    icon: Iconsax.safe_home,
                    title: "Mes adresses",
                    subtitle: "Définir l'adresse de livraison",
                    onTap: () => Get.to(() => const UserAddressScreen()),
                  ),
                  const GMSettingsMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: "Mon panier",
                    subtitle:
                        "Ajouter, retirer des produits et passer à la caisse",
                  ),
                  GMSettingsMenuTile(
                    icon: Iconsax.bag_tick,
                    title: "Mes commandes",
                    subtitle: "Commandes en cours et terminées",
                    onTap: () => Get.to(() => const OrderScreen()),
                  ),
                  const GMSettingsMenuTile(
                    icon: Iconsax.bank,
                    title: "Comptes bancaires",
                    subtitle:
                        "Retirer le solde vers les comptes bancaires enregistrés",
                  ),
                  const GMSettingsMenuTile(
                    icon: Iconsax.discount_shape,
                    title: "Mes coupons",
                    subtitle: "Liste de tous les coupons de réduction",
                  ),
                  const GMSettingsMenuTile(
                    icon: Iconsax.notification,
                    title: "Notifications",
                    subtitle: "Configurer les notifications",
                  ),
                  const GMSettingsMenuTile(
                    icon: Iconsax.security_card,
                    title: "Confidentialité du compte",
                    subtitle:
                        "Gérer l'utilisation des données et les comptes connectés",
                  ),

                  /// -- App Settings
                  SizedBox(height: GSizes.spaceBtwSections),
                  GMSectionHeading(
                    title: "Paramètres application",
                    showActionButton: false,
                  ),
                  SizedBox(height: GSizes.spaceBtwItems),
                  GMSettingsMenuTile(
                    icon: Iconsax.document_upload,
                    title: "Charger des données",
                    subtitle:
                        "Télécharger les données sur votre Cloud Firebase",
                  ),
                  GMSettingsMenuTile(
                    icon: Iconsax.location,
                    title: "Géolocalisation",
                    subtitle:
                        "Définir les recommandations selon la localisation",
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  GMSettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: "Mode sécurisé",
                    subtitle:
                        "Les résultats de recherches sont sûrs pour tous les âges",
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  GMSettingsMenuTile(
                    icon: Iconsax.image,
                    title: "Qualité d'image HD",
                    subtitle: "Définir la qualité d'image à afficher",
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),

                  /// -- Logout Button
                  const SizedBox(height: GSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Text(
                        "Déconnexion",
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
