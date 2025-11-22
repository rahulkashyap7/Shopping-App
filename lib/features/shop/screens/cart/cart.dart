import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/common/widgets/appbar/appbar.dart';
import 'package:shopping_app/common/widgets/loaders/animation_loader.dart';
import 'package:shopping_app/features/shop/controls/product/cart_controller.dart';
import 'package:shopping_app/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:shopping_app/features/shop/screens/checkout/checkout.dart';
import 'package:shopping_app/navigation_menu.dart';
import 'package:shopping_app/utils/constants/image_strings.dart';
import 'package:shopping_app/utils/constants/sizes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Scaffold(
      appBar: RAppBar(showBackArrow: true, title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall)),
      body: Obx(
        (){
          /// Nothing Found Widget
            final emptyWidget = RAnimationLoaderWidget(
                text: 'Whoops Cart is Empty.',
                animation: RImages.cartAnimation,
              showActon: true,
              actionText: 'Let\'s fill it.',
              onActionPressed: () => Get.off(() => NavigationMenu()),
            );

        if (controller.cartItems.isEmpty) {
          return emptyWidget;
        } else {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(RSizes.defaultSpace),

              /// Item in Cart
              child: RCartItems(),
            ),
          );
        }
      }),

      // Checkout Button
      bottomNavigationBar: controller.cartItems.isEmpty ? SizedBox() : Padding(
        padding: const EdgeInsets.all(RSizes.defaultSpace),
        child: ElevatedButton(onPressed: () => Get.to(() => const CheckoutScreen()),
            child: Obx(() => Text('Checkout \$${controller.totalCartPrice.value}'))),
      ),
    );
  }
}
