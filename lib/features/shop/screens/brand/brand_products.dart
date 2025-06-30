import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/common/widgets/appbar/appbar.dart';
import 'package:gabon_meuble_app/common/widgets/brands/brand_card.dart';
import 'package:gabon_meuble_app/common/widgets/products/sortable/sortable_products.dart';
import 'package:gabon_meuble_app/utils/constants/sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GMAppBar(title: Text("Atelier Mbadinga"), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(GSizes.defaultSpace),
          child: Column(
            children: [
              /// Brand Detail
              GMBrandCard(showBorder: true),
              SizedBox(height: GSizes.spaceBtwSections),

              GMSortableProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
