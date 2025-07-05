import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/common/widgets/appbar/appbar.dart';
import 'package:gabon_meuble_app/common/widgets/appbar/tabbar.dart';
import 'package:gabon_meuble_app/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:gabon_meuble_app/common/widgets/images/gm_rounded_image.dart';
import 'package:gabon_meuble_app/common/widgets/layouts/grid_layout.dart';
import 'package:gabon_meuble_app/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:gabon_meuble_app/common/widgets/products/products_cards/product_card_vertical.dart';
import 'package:gabon_meuble_app/common/widgets/texts/section_heading.dart';
import 'package:gabon_meuble_app/features/shop/controllers/categories/category_controller.dart';
import 'package:gabon_meuble_app/features/shop/controllers/products/product_controller.dart';
import 'package:gabon_meuble_app/features/shop/screens/brand/all_brands.dart';
import 'package:gabon_meuble_app/features/shop/screens/brand/brand_products.dart';
import 'package:gabon_meuble_app/utils/constants/colors.dart';
import 'package:gabon_meuble_app/utils/constants/sizes.dart';
import 'package:gabon_meuble_app/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/brands/brand_card.dart';

class ExplorerScreen extends StatelessWidget {
  const ExplorerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productController = Get.put(ProductController());
    final categorieController = Get.put(CategorieController());
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: GMAppBar(
          title: Text(
            'Explorer',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [GMCartCounterIcon(onPressed: () {})],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor:
                    GMHelperFunctions.isDarkMode(context)
                        ? GMColors.black
                        : GMColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(GSizes.defaultSpace),
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      const SizedBox(height: GSizes.spaceBtwItems),

                      /// Barre de recherche
                      const GMSearchContainer(
                        text: "Rechercher un produit...",
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(height: GSizes.spaceBtwSections),

                      /// Section Ateliers & Artisans
                      GMSectionHeading(
                        title: "Ateliers & Artisans",
                        onPressed: () => Get.to(() => const AllBrandsScreen()),
                      ),
                      const SizedBox(height: GSizes.spaceBtwItems / 1.5),

                      GestureDetector(
                        onTap: () => Get.to(() => const BrandProducts()),
                        child: GMGridLayout(
                          itemCount: 4,
                          mainAxisExtent: 80,
                          itemBuilder:
                              (_, index) =>
                                  const GMBrandCard(showBorder: false),
                        ),
                      ),
                    ],
                  ),
                ),

                /// Onglets
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(48),
                  child: Obx(() {
                    final tabs = [
                      const Tab(child: Text("Tous les produits")),
                      ...categorieController.categories.map(
                        (cat) => Tab(child: Text(cat.nom)),
                      ),
                    ];
                    return GMTabBar(tabs: tabs);
                  }),
                ),
              ),
            ];
          },
          body: Obx(() {
            final categories = categorieController.categories;
            return TabBarView(
              children: [
                // Onglet "Tous les produits"
                Padding(
                  padding: const EdgeInsets.all(GSizes.defaultSpace),
                  child: Obx(
                    () => GMGridLayout(
                      itemCount: productController.produits.length,
                      itemBuilder: (_, index) {
                        final produit = productController.produits[index];
                        return GMProductCardVertical(
                          widget: GMRoundedImage(
                            imageUrl: produit.image,
                            applyImageRadius: true,
                          ),
                          titleProduct: produit.titre,
                          nameBrand: "Artisan #${produit.artisanId}",
                        );
                      },
                    ),
                  ),
                ),
                // Onglets par catégorie
                ...categories.map(
                  (cat) => Padding(
                    padding: const EdgeInsets.all(GSizes.defaultSpace),
                    child: Obx(() {
                      final produitsCat = productController
                          .produitsParCategorie(cat.id.toString());
                      return GMGridLayout(
                        itemCount: produitsCat.length,
                        itemBuilder: (_, index) {
                          final produit = produitsCat[index];
                          return GMProductCardVertical(
                            widget: GMRoundedImage(
                              imageUrl: produit.image,
                              applyImageRadius: true,
                            ),
                            titleProduct: produit.titre,
                            nameBrand: "Artisan #${produit.artisanId}",
                          );
                        },
                      );
                    }),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
