import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/common/widgets/images/gm_rounded_image.dart';
import 'package:gabon_meuble_app/features/shop/controllers/artisans/artisan_controller.dart';
import 'package:gabon_meuble_app/features/shop/controllers/categories/category_controller.dart';
import 'package:gabon_meuble_app/features/shop/controllers/commandes/commande_controller.dart';
import 'package:gabon_meuble_app/features/shop/controllers/products/product_controller.dart';
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
    final productController = Get.put(ProductController());
    final artisanController = Get.put(ArtisanController());
    final commandeController = Get.put(CommandeController());
    Get.put(CategorieController());
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
                  Obx(() {
                    final commandes = commandeController.commandes;
                    final commandesToShow =
                        commandes.length > 3
                            ? commandes.sublist(0, 3)
                            : commandes;
                    return Column(
                      children:
                          commandesToShow
                              .map(
                                (commande) => OrderCard(
                                  productName:
                                      productController
                                          .getProduitById(commande.produitId)
                                          ?.titre ??
                                      "Produit inconnu",
                                  status: commande.statut,
                                ),
                              )
                              .toList(),
                    );
                  }),
                  const SizedBox(height: GSizes.spaceBtwSections),

                  /// Artisans recommandés
                  const GMSectionHeading(
                    title: "Artisans recommandés",
                    showActionButton: false,
                  ),
                  const SizedBox(height: GSizes.spaceBtwItems),
                  Obx(() {
                    final artisans = artisanController.artisans;
                    if (artisans.isEmpty) {
                      return const Center(child: Text("Aucun artisan trouvé"));
                    }
                    return SizedBox(
                      height: 600,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: artisans.length > 5 ? 5 : artisans.length,
                        itemBuilder: (context, index) {
                          final artisan = artisans[index];
                          return ArtisanCard(
                            name: artisan.nom,
                            speciality: artisan.specialite,
                            location: artisan.ville,
                            image: artisan.image,
                          );
                        },
                      ),
                    );
                  }),
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
                  Obx(() {
                    final produits = productController.produits;
                    final produitsToShow =
                        produits.length > 15
                            ? produits.sublist(0, 15)
                            : produits;
                    return GMGridLayout(
                      itemCount: produitsToShow.length,
                      itemBuilder: (_, index) {
                        final produit = produitsToShow[index];
                        return GMProductCardVertical(
                          widget: GMRoundedImage(
                            imageUrl: produit.image,
                            applyImageRadius: true,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                          titleProduct: produit.titre,
                          nameBrand: produit.artisanNom ?? "",
                        );
                      },
                    );
                  }),
                  const SizedBox(height: GSizes.spaceBtwSections),

                  /// Suggestions personnalisées
                  const GMSectionHeading(
                    title: "Suggestions pour vous",
                    showActionButton: false,
                  ),
                  const SizedBox(height: GSizes.spaceBtwItems),
                  Obx(() {
                    final produits = productController.produits;
                    final suggestions =
                        produits.length > 15
                            ? produits.sublist(0, 15)
                            : produits;
                    return GMGridLayout(
                      itemCount: suggestions.length,
                      itemBuilder: (_, index) {
                        final produit = suggestions[index];
                        return GMProductCardVertical(
                          widget: GMRoundedImage(
                            imageUrl: produit.image,
                            applyImageRadius: true,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                          titleProduct: produit.titre,
                          nameBrand: "Artisan #${produit.artisanId}",
                        );
                      },
                    );
                  }),

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
                            width: double.infinity,
                            imageUrl: GMImages.productImage3,
                            applyImageRadius: true,
                            fit: BoxFit.cover,
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
