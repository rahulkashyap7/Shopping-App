import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/common/widgets/appbar/appbar.dart';
import 'package:shopping_app/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:shopping_app/features/shop/screens/checkout/checkout.dart';
import 'package:shopping_app/utils/constants/sizes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RAppBar(showBackArrow: true, title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall)),
      body: Padding(
        padding: EdgeInsets.all(RSizes.defaultSpace),

        // Items in Cart
        child: RCartItems()
      ),

      // Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(RSizes.defaultSpace),
        child: ElevatedButton(onPressed: () => Get.to(() => const CheckoutScreen()), child: Text('Checkout \$256.0')),
      ),
    );
  }
}
