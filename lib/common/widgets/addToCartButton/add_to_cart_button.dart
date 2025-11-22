import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopping_app/features/shop/controls/product/cart_controller.dart';
import 'package:shopping_app/features/shop/models/product_model.dart';
import 'package:shopping_app/features/shop/screens/product_details/product_details.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class ProductCardAddToCartButton extends StatelessWidget {
  const ProductCardAddToCartButton({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return InkWell(
      onTap: () {
        // If the product have variation then show the product details for variation selection.
        // Else add product to the cart.
        if (product.productType == ProductType.single.toString()) {
          final cartItem = cartController.convertToCartItem(product, 1);
          cartController.addOneToCart(cartItem);
        } else {
          Get.to(() => ProductDetailScreen(product: product));
        }
      },
      child: Obx(() {

        final productQuantityInCart = cartController.getProductQuantityInCart(product.id);
        return Container(
            decoration: BoxDecoration(
              color: productQuantityInCart > 0 ? RColors.primary : RColors.dark,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(RSizes.cardRadiusMd),
                bottomRight: Radius.circular(RSizes.productImageRadius),
              ),
            ),
            child: SizedBox(
                width: RSizes.iconLg * 1.2,
                height: RSizes.iconLg * 1.2,
              child: Center(
                  child: productQuantityInCart > 0
                      ? Text(productQuantityInCart.toString(),
                          style: Theme.of(context).textTheme.bodyLarge!.apply(color: Colors.white))
                      : Icon(Iconsax.add, color: RColors.white))),
        );
      }
      ),
    );
  }
}
