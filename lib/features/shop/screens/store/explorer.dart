import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/common/widgets/appbar/appbar.dart';
import 'package:gabon_meuble_app/common/widgets/appbar/tabbar.dart';
import 'package:gabon_meuble_app/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:gabon_meuble_app/common/widgets/layouts/grid_layout.dart';
import 'package:gabon_meuble_app/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:gabon_meuble_app/common/widgets/texts/section_heading.dart';
import 'package:gabon_meuble_app/features/shop/screens/brand/all_brands.dart';
import 'package:gabon_meuble_app/features/shop/screens/brand/brand_products.dart';
import 'package:gabon_meuble_app/features/shop/screens/store/widgets/category_tab.dart';
import 'package:gabon_meuble_app/utils/constants/colors.dart';
import 'package:gabon_meuble_app/utils/constants/sizes.dart';
import 'package:gabon_meuble_app/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/brands/brand_card.dart';

class ExplorerScreen extends StatelessWidget {
  const ExplorerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
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
                bottom: const GMTabBar(
                  tabs: [
                    Tab(child: Text("Tous les produits")),
                    Tab(child: Text("Artisanat bois")),
                    Tab(child: Text("Métal & soudure")),
                    Tab(child: Text("Meubles intérieurs")),
                    Tab(child: Text("Meubles extérieurs")),
                  ],
                ),
              ),
            ];
          },
          body: const TabBarView(
            children: [
              GMCategoryTab(), // Tous
              GMCategoryTab(), // Bois
              GMCategoryTab(), // Métal
              GMCategoryTab(), // Intérieur
              GMCategoryTab(), // Extérieur
            ],
          ),
        ),
      ),
    );
  }
}
