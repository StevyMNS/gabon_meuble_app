import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gabon_meuble_app/common/widgets/appbar/appbar.dart';
import 'package:gabon_meuble_app/features/shop/controllers/compare_controller.dart';
import 'package:gabon_meuble_app/utils/constants/sizes.dart';

// ...existing imports...

class CompareProductsScreen extends StatelessWidget {
  CompareProductsScreen({super.key});

  final List<Map<String, dynamic>> allProducts = [
    {
      'title': 'Chaise en bois',
      'brand': 'Atelier Mba',
      'price': 25000,
      'image': 'assets/images/content/ryan-riggins-9v7UJS92HYc-unsplash.jpg',
    },
    {
      'title': 'Chaise métal',
      'brand': 'Soudure Pro',
      'price': 22000,
      'image': 'assets/images/content/florian-paulus-mncutfuimC8-unsplash.jpg',
    },
    {
      'title': 'Table basse',
      'brand': 'Meubles Gabon',
      'price': 40000,
      'image': 'assets/images/content/zane-persaud-IzyZynNNX1U-unsplash.jpg',
    },
  ];

  // ...imports et classe...

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CompareController());

    return Scaffold(
      appBar: const GMAppBar(
        title: Text("Comparer les prix"),
        showBackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(GSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sélectionnez 2 produits à comparer :",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: GSizes.spaceBtwSections),
            // PAS besoin de Obx ici !
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.7,
                ),
                itemCount: allProducts.length,
                itemBuilder: (context, index) {
                  final product = allProducts[index];
                  // Obx ici pour chaque carte qui dépend de la sélection
                  return Obx(() {
                    final isSelected = controller.isSelected(product);
                    return GestureDetector(
                      onTap: () => controller.toggleProduct(product),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color:
                                isSelected
                                    ? Theme.of(context).colorScheme.primary
                                    : Colors.grey.shade300,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(16),
                          color:
                              isSelected
                                  ? Theme.of(
                                    context,
                                  ).colorScheme.primary.withValues(alpha: 0.08)
                                  : null,
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(product['image'], height: 80),
                            const SizedBox(height: 10),
                            Flexible(
                              child: Text(
                                product['title'],
                                style: Theme.of(context).textTheme.titleMedium,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Text(
                              product['brand'],
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            const SizedBox(height: 6),
                            Text(
                              "${product['price']} F",
                              style: Theme.of(
                                context,
                              ).textTheme.titleLarge?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            if (isSelected)
                              const Padding(
                                padding: EdgeInsets.only(top: 6.0),
                                child: Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  });
                },
              ),
            ),
            // Obx ici pour la comparaison
            Obx(() {
              if (controller.selectedProducts.length == 2) {
                final p1 = controller.selectedProducts[0];
                final p2 = controller.selectedProducts[1];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Divider(),
                    Text(
                      "Comparaison :",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _ProductCompareCard(product: p1),
                        _ProductCompareCard(product: p2),
                      ],
                    ),
                  ],
                );
              }
              return const SizedBox.shrink();
            }),
          ],
        ),
      ),
    );
  }
}

class _ProductCompareCard extends StatelessWidget {
  final Map<String, dynamic> product;
  const _ProductCompareCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(product['image'], height: 60),
        Text(
          product['title'],
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        Text(
          "${product['price']} FCFA",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
