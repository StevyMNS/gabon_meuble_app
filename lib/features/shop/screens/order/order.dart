import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/common/widgets/appbar/appbar.dart';
import 'package:gabon_meuble_app/features/shop/screens/order/widgets/order_list.dart';
import 'package:gabon_meuble_app/utils/constants/sizes.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GMAppBar(
        title: Text(
          "Mes commandes",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(GSizes.defaultSpace),

        /// -- Orders
        child: GMOrderListItems(),
      ),
    );
  }
}
