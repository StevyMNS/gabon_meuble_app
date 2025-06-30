import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/common/widgets/images/gm_rounded_image.dart';
import 'package:gabon_meuble_app/features/shop/screens/compare/compare_product.dart';
import 'package:gabon_meuble_app/features/shop/screens/order/order.dart';
import 'package:gabon_meuble_app/features/shop/screens/wishlist/wishlist.dart';
import 'package:get/get.dart';
import 'package:gabon_meuble_app/utils/constants/sizes.dart';
import 'package:gabon_meuble_app/utils/constants/image_strings.dart';
import 'package:gabon_meuble_app/features/shop/screens/all_products/all_products.dart';
import 'package:gabon_meuble_app/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:gabon_meuble_app/features/shop/screens/home/widgets/home_categories.dart';
import 'package:gabon_meuble_app/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:gabon_meuble_app/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:gabon_meuble_app/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:gabon_meuble_app/common/widgets/texts/section_heading.dart';
import 'package:gabon_meuble_app/common/widgets/layouts/grid_layout.dart';
import 'package:gabon_meuble_app/common/widgets/products/products_cards/product_card_vertical.dart';
import 'package:gabon_meuble_app/common/widgets/products/products_cards/artisan_card.dart'; // ← à créer
import 'package:gabon_meuble_app/common/widgets/products/products_cards/order_card.dart'; // ← à créer

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// --- HEADER ---
            const GMPrimaryHeaderContainer(
              child: Column(
                children: [
                  GMHomeAppBar(),
                  SizedBox(height: GSizes.spaceBtwSections),
                  GMSearchContainer(text: "Recherchez un produit..."),
                  SizedBox(height: GSizes.spaceBtwSections),
                  Padding(
                    padding: EdgeInsets.only(left: GSizes.defaultSpace),
                    child: Column(
                      children: [
                        GMSectionHeading(
                          title: "Catégories",
                          showActionButton: false,
                          textColor: Colors.white,
                        ),
                        SizedBox(height: GSizes.spaceBtwItems),
                        GMHomeCategories(),
                      ],
                    ),
                  ),
                  SizedBox(height: GSizes.spaceBtwSections),
                ],
              ),
            ),

            /// --- BODY ---
            Padding(
              padding: const EdgeInsets.all(GSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Promo Slider
                  const GMPromoSlider(
                    banners: [
                      GMImages.productImage34,
                      GMImages.productImage35,
                      GMImages.productImage36,
                    ],
                  ),
                  const SizedBox(height: GSizes.spaceBtwSections),

                  /// Commandes en cours
                  GMSectionHeading(
                    title: "Mes commandes",
                    onPressed: () => Get.to(() => const OrderScreen()),
                  ),
                  const SizedBox(height: GSizes.spaceBtwItems),
                  OrderCard(
                    productName: "Chaise design",
                    status: "En fabrication",
                  ),
                  OrderCard(
                    productName: "Table bois massif",
                    status: "En livraison",
                  ),
                  const SizedBox(height: GSizes.spaceBtwSections),

                  /// Artisans recommandés
                  const GMSectionHeading(
                    title: "Artisans recommandés",
                    showActionButton: false,
                  ),
                  const SizedBox(height: GSizes.spaceBtwItems),
                  ArtisanCard(
                    name: "Jean Mbadinga",
                    speciality: "Menuisier",
                    location: "Libreville",
                    image: "assets/images/content/jean.jpeg",
                  ),
                  ArtisanCard(
                    name: "Sarah Ndong",
                    speciality: "Soudeuse",
                    location: "Port-Gentil",
                    image: "assets/images/content/ndong.jpeg",
                  ),
                  const SizedBox(height: GSizes.spaceBtwSections),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.compare_arrows),
                    label: const Text("Comparer les prix"),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(48),
                    ),
                    onPressed: () {
                      Get.to(() => CompareProductsScreen());
                    },
                  ),
                  const SizedBox(height: GSizes.spaceBtwSections),

                  /// Produits populaires
                  GMSectionHeading(
                    title: "Produits populaires",
                    onPressed: () => Get.to(() => const AllProducts()),
                  ),
                  const SizedBox(height: GSizes.spaceBtwItems),
                  GMGridLayout(
                    itemCount: 2,
                    itemBuilder:
                        (_, index) => const GMProductCardVertical(
                          widget: GMRoundedImage(
                            height: 120,
                            imageUrl: GMImages.productImage1,
                            applyImageRadius: true,
                          ),
                          titleProduct: "Portail vert avec motif doré",
                          nameBrand: "Sarah Ndong",
                        ),
                  ),

                  const SizedBox(height: GSizes.spaceBtwSections),

                  /// Suggestions personnalisées
                  const GMSectionHeading(
                    title: "Suggestions pour vous",
                    showActionButton: false,
                  ),
                  const SizedBox(height: GSizes.spaceBtwItems),
                  GMGridLayout(
                    itemCount: 2,
                    itemBuilder:
                        (_, index) => const GMProductCardVertical(
                          widget: GMRoundedImage(
                            imageUrl: GMImages.productImage2,
                            applyImageRadius: true,
                          ),
                          titleProduct: "Salon gris de 8 places",
                          nameBrand: "Jean Mbadinga",
                        ),
                  ),

                  const SizedBox(height: GSizes.spaceBtwSections),

                  /// Suggestions personnalisées
                  GMSectionHeading(
                    title: "Liste de Favoris",
                    showActionButton: true,
                    onPressed: () => Get.to(() => const FavouriteScreen()),
                  ),
                  const SizedBox(height: GSizes.spaceBtwItems),
                  GMGridLayout(
                    itemCount: 4,
                    itemBuilder:
                        (_, index) => const GMProductCardVertical(
                          widget: GMRoundedImage(
                            imageUrl: GMImages.productImage3,
                            applyImageRadius: true,
                          ),
                          titleProduct: "Grille de fenetres",
                          nameBrand: "Sarah Ndong",
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
