import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/common/widgets/appbar/appbar.dart';
import 'package:gabon_meuble_app/common/widgets/products/cart/cart_item.dart';
import 'package:gabon_meuble_app/features/shop/screens/checkout/checkout.dart';
import 'package:gabon_meuble_app/utils/constants/sizes.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GMAppBar(
        showBackArrow: true,
        title: Text("panier", style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: const EdgeInsets.all(GSizes.defaultSpace),

        /// -- Items in Cart
        child: GMCartItem(),
      ),

      /// Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(GSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => const CheckoutScreen()),
          child: Text("Vérification de la commande \$256.0"),
        ),
      ),
    );
  }
}
