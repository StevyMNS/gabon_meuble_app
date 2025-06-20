import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/features/shop/screens/all_products/all_products.dart';
import 'package:gabon_meuble_app/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:gabon_meuble_app/features/shop/screens/home/widgets/home_categories.dart';
import 'package:gabon_meuble_app/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:gabon_meuble_app/utils/constants/sizes.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/products_cards/product_card_vertical.dart';
import '../../../../utils/constants/image_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const GMPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// -- Appbar ---
                  GMHomeAppBar(),
                  SizedBox(height: GSizes.spaceBtwSections),

                  /// -- Searchbar --
                  GMSearchContainer(text: "Recherchez un produit..."),
                  SizedBox(height: GSizes.spaceBtwSections),

                  /// -- Categories --
                  Padding(
                    padding: EdgeInsets.only(left: GSizes.defaultSpace),
                    child: Column(
                      children: [
                        /// Heading
                        GMSectionHeading(
                          title: "Catégories",
                          showActionButton: false,
                          textColor: Colors.white,
                        ),
                        SizedBox(height: GSizes.spaceBtwItems),

                        /// Categories
                        GMHomeCategories(),
                      ],
                    ),
                  ),
                  SizedBox(height: GSizes.spaceBtwSections),
                ],
              ),
            ),

            /// Body
            Padding(
              padding: const EdgeInsets.all(GSizes.defaultSpace),
              child: Column(
                children: [
                  /// -- Promo Slider --
                  const GMPromoSlider(
                    banners: [
                      GMImages.promoBanner1,
                      GMImages.promoBanner2,
                      GMImages.promoBanner3,
                    ],
                  ),
                  const SizedBox(height: GSizes.spaceBtwSections),

                  /// -- Heading --
                  GMSectionHeading(
                    title: "Produits populaires",
                    onPressed: () => Get.to(() => const AllProducts()),
                  ),
                  const SizedBox(height: GSizes.spaceBtwSections),

                  /// -- Popular Products --
                  GMGridLayout(
                    itemCount: 2,
                    itemBuilder: (_, index) => const GMProductCardVertical(),
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
