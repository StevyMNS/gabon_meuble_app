import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/common/widgets/appbar/appbar.dart';
import 'package:gabon_meuble_app/common/widgets/appbar/tabbar.dart';
import 'package:gabon_meuble_app/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:gabon_meuble_app/common/widgets/layouts/grid_layout.dart';
import 'package:gabon_meuble_app/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:gabon_meuble_app/common/widgets/texts/section_heading.dart';
import 'package:gabon_meuble_app/features/shop/screens/brand/all_brands.dart';
import 'package:gabon_meuble_app/features/shop/screens/store/widgets/category_tab.dart';
import 'package:gabon_meuble_app/utils/constants/colors.dart';
import 'package:gabon_meuble_app/utils/constants/sizes.dart';
import 'package:gabon_meuble_app/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/brands/brand_card.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: GMAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [GMCartCounterIcon(onPressed: () {})],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxxIsScrolled) {
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
                  padding: const EdgeInsetsGeometry.all(GSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      /// -- Search bar
                      const SizedBox(height: GSizes.spaceBtwItems),
                      const GMSearchContainer(
                        text: "Search in Store",
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(height: GSizes.spaceBtwSections),

                      /// -- Featured Brands
                      GMSectionHeading(
                        title: "Featured Brands",
                        onPressed: () => Get.to(() => const AllBrandsScreen()),
                      ),
                      const SizedBox(height: GSizes.spaceBtwItems / 1.5),

                      /// -- Brands GRID
                      GMGridLayout(
                        itemCount: 4,
                        mainAxisExtent: 80,
                        itemBuilder: (_, index) {
                          return const GMBrandCard(showBorder: false);
                        },
                      ),
                    ],
                  ),
                ),

                /// -- Tabs
                bottom: const GMTabBar(
                  tabs: [
                    Tab(child: Text("Sports")),
                    Tab(child: Text("Furniture")),
                    Tab(child: Text("Electronics")),
                    Tab(child: Text("Clothes")),
                    Tab(child: Text("Cosmetic")),
                  ],
                ),
              ),
            ];
          },
          body: const TabBarView(
            children: [
              GMCategoryTab(),
              GMCategoryTab(),
              GMCategoryTab(),
              GMCategoryTab(),
              GMCategoryTab(),
            ],
          ),
        ),
      ),
    );
  }
}
