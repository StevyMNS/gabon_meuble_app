import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/common/widgets/images/gm_rounded_image.dart';
import 'package:gabon_meuble_app/common/widgets/layouts/grid_layout.dart';
import 'package:gabon_meuble_app/common/widgets/products/products_cards/product_card_vertical.dart';
import 'package:gabon_meuble_app/utils/constants/image_strings.dart';
import 'package:gabon_meuble_app/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class GMSortableProducts extends StatelessWidget {
  const GMSortableProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Dropdown
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (value) {},
          items:
              [
                    'Nom',
                    'Prix decroissant',
                    'prix croissant',
                    'Promotion',
                    'Nouveautés',
                    'Popularité',
                  ]
                  .map(
                    (option) =>
                        DropdownMenuItem(value: option, child: Text(option)),
                  )
                  .toList(),
        ),
        const SizedBox(height: GSizes.spaceBtwSections),
        GMGridLayout(
          itemCount: 8,
          itemBuilder:
              (_, index) => const GMProductCardVertical(
                widget: GMRoundedImage(
                  imageUrl: GMImages.productImage1,
                  applyImageRadius: true,
                ), titleProduct: "Portail vert avec motif doré", nameBrand: "Sarah Ndong",
              ),
        ),
      ],
    );
  }
}
