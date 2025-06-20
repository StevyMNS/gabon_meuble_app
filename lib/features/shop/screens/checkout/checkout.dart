import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/common/widgets/appbar/appbar.dart';
import 'package:gabon_meuble_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:gabon_meuble_app/common/widgets/products/cart/coupon_widget.dart';
import 'package:gabon_meuble_app/common/widgets/success_screen/success_screen.dart';
import 'package:gabon_meuble_app/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:gabon_meuble_app/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:gabon_meuble_app/features/shop/screens/checkout/widgets/billing_amont_section.dart';
import 'package:gabon_meuble_app/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:gabon_meuble_app/navigation_menu.dart';
import 'package:gabon_meuble_app/utils/constants/colors.dart';
import 'package:gabon_meuble_app/utils/constants/image_strings.dart';
import 'package:gabon_meuble_app/utils/constants/sizes.dart';
import 'package:gabon_meuble_app/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = GMHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: GMAppBar(
        showBackArrow: true,
        title: Text(
          "Order Review",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(GSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Items in Cart
              GMCartItems(showAddRemoveButtons: false),
              SizedBox(height: GSizes.spaceBtwSections),

              /// Coupon TextField
              GMCouponCode(),
              SizedBox(height: GSizes.spaceBtwSections),

              /// -- Billing Section
              GMRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(GSizes.md),
                backgroundColor: dark ? GMColors.black : GMColors.white,
                child: Column(
                  children: [
                    /// Princing
                    GMBillingAmountSection(),
                    const SizedBox(height: GSizes.spaceBtwItems),

                    /// Divider
                    const Divider(),
                    const SizedBox(height: GSizes.spaceBtwItems),

                    /// Payment Methods
                    GMBillingPaymentSection(),
                    const SizedBox(height: GSizes.spaceBtwItems),

                    /// Address
                    GMBillingAddressSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(GSizes.defaultSpace),
        child: ElevatedButton(
          onPressed:
              () => Get.to(
                () => SuccessScreen(
                  image: GMImages.successfulPaymentIcon,
                  title: "Payment Succes!",
                  subTitle: "Your Item will be shipped soon!",
                  onPressed: () => Get.offAll(() => const NavigationMenu()),
                ),
              ),
          child: Text("Checkout \$256.0"),
        ),
      ),
    );
  }
}
