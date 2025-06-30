import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/common/widgets/texts/section_heading.dart';
import 'package:gabon_meuble_app/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:gabon_meuble_app/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:gabon_meuble_app/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:gabon_meuble_app/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:gabon_meuble_app/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:gabon_meuble_app/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:gabon_meuble_app/utils/constants/sizes.dart';
import 'package:gabon_meuble_app/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GMHelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: GMBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 1 - Product Image Slider
            GMProductImageSlider(),

            /// 2 - Product Details
            Padding(
              padding: EdgeInsets.only(
                right: GSizes.defaultSpace,
                left: GSizes.defaultSpace,
                bottom: GSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  /// Rating & Share Button
                  GMRatingAndShare(),

                  /// - Price, title, Stack & Brand
                  GMProductMetaData(),

                  /// -- Attributes
                  GMProductAttributes(),
                  const SizedBox(height: GSizes.spaceBtwSections),

                  /// -- Checkout Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Commander"),
                    ),
                  ),
                  const SizedBox(height: GSizes.spaceBtwSections),

                  /// - Description
                  const GMSectionHeading(
                    title: "Description",
                    showActionButton: false,
                  ),
                  const SizedBox(height: GSizes.spaceBtwItems),
                  const ReadMoreText(
                    "Ceci est une description du produit pour le portail vert. Il y a plus de choses à faire pour améliorer ce texte, mais ceci est juste un exemple simple de ce que vous pouvez faire.",
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: " Voir plus",
                    trimExpandedText: " moins",
                    moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                    lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  /// - Reviews
                  const Divider(),
                  const SizedBox(height: GSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const GMSectionHeading(
                        title: "Avis (199)",
                        showActionButton: false,
                      ),
                      IconButton(
                        onPressed:
                            () => Get.to(() => const ProductReviewsScreen()),
                        icon: const Icon(Iconsax.arrow_right_3, size: 18),
                      ),
                    ],
                  ),
                  const SizedBox(height: GSizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
