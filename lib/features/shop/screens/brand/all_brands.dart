import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/common/widgets/appbar/appbar.dart';
import 'package:gabon_meuble_app/common/widgets/brands/brand_card.dart';
import 'package:gabon_meuble_app/common/widgets/layouts/grid_layout.dart';
import 'package:gabon_meuble_app/common/widgets/texts/section_heading.dart';
import 'package:gabon_meuble_app/features/shop/screens/brand/brand_products.dart';
import 'package:gabon_meuble_app/utils/constants/sizes.dart';
import 'package:get/get.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GMAppBar(title: Text("Ateliers"), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(GSizes.defaultSpace),
          child: Column(
            children: [
              /// Heading
              const GMSectionHeading(
                title: "ateliers",
                showActionButton: false,
              ),
              const SizedBox(height: GSizes.spaceBtwItems),

              /// -- Brands
              GMGridLayout(
                itemCount: 10,
                mainAxisExtent: 80,
                itemBuilder:
                    (context, index) => GMBrandCard(
                      showBorder: true,
                      onTap: () => Get.to(() => const BrandProducts()),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
