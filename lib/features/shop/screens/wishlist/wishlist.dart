import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/common/widgets/appbar/appbar.dart';
import 'package:gabon_meuble_app/common/widgets/icons/gm_circular_icon.dart';
import 'package:gabon_meuble_app/common/widgets/images/gm_rounded_image.dart';
import 'package:gabon_meuble_app/common/widgets/layouts/grid_layout.dart';
import 'package:gabon_meuble_app/common/widgets/products/products_cards/product_card_vertical.dart';
import 'package:gabon_meuble_app/features/shop/screens/home/home.dart';
import 'package:gabon_meuble_app/utils/constants/image_strings.dart';
import 'package:gabon_meuble_app/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GMAppBar(
        showBackArrow: true,
        title: Text(
          "Favoris",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          GMCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(const HomeScreen()),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(GSizes.defaultSpace),
          child: Column(
            children: [
              GMGridLayout(
                itemCount: 6,
                itemBuilder:
                    (_, index) => const GMProductCardVertical(
                      widget: GMRoundedImage(
                        imageUrl: GMImages.productImage1,
                        applyImageRadius: true,
                      ),
                      titleProduct: "Portail vert avec motif doré",
                      nameBrand: "Sarah Ndong",
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
