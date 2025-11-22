import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/features/shop/controls/product/cart_controller.dart';
import '../../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';

class RCartItems extends StatelessWidget {
  const RCartItems({super.key, this.showAddRemoveButtons = true});

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;

    return Obx(
      () => ListView.separated(
        shrinkWrap: true,
        itemCount: cartController.cartItems.length,
        separatorBuilder: (_, __) => SizedBox(height: RSizes.spaceBtwSections),
        itemBuilder: (_, index) => Obx(
            () {
              final item = cartController.cartItems[index];
              return Column(
                children: [
                  RCartItem(cartItem: item),
                  if(showAddRemoveButtons) const SizedBox(
                      height: RSizes.spaceBtwItems),

                  // Add Remove Button Row with total price
                  if(showAddRemoveButtons)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                      children: [
                        // Extra Space
                        SizedBox(width: 70),

                        // Add Remove Button
                        RProductQuantityWithAddRemoveButton(
                          quantity: item.quantity,
                          add: () => cartController.addOneToCart(item),
                          remove: () => cartController.removeOneToCart(item),
                        ),
                      ],
                    ),

                    // product Total price
                        RProductPriceText(price: (item.price * item.quantity).toStringAsFixed(1)),
                      ],
                    ),
                ],
              );
            }
        ),
      ),
    );
  }
}
