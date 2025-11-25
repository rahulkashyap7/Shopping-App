import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/common/widgets/appbar/appbar.dart';
import 'package:shopping_app/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:shopping_app/common/widgets/loaders/loaders.dart';
import 'package:shopping_app/common/widgets/success_screen/success_screen.dart';
import 'package:shopping_app/features/shop/controls/product/cart_controller.dart';
import 'package:shopping_app/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:shopping_app/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:shopping_app/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:shopping_app/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:shopping_app/utils/constants/image_strings.dart';
import 'package:shopping_app/utils/constants/sizes.dart';
import 'package:shopping_app/utils/helpers/pricing_calculator.dart';

import '../../../../common/widgets/products/cart/coupon_widget.dart';
import '../../../../navigation_menu.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/helper_function.dart';
import '../../controls/product/order_controller.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;
    final orderController = Get.put(OrderController());
    final totalAmount = RPricingCalculator.calculateTotalPrice(subTotal, 'US');

    final dark = RHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: RAppBar(
          showBackArrow: true,
          title: Text('Order Reviews',
              style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(RSizes.defaultSpace),
          child: Column(
            children: [
              // Items in cart
              const RCartItems(showAddRemoveButtons: false),
              const SizedBox(height: RSizes.spaceBtwSections),

              // Coupon Text field
              RCouponCode(),
              const SizedBox(height: RSizes.spaceBtwSections),

              // Billing Section
              RRoundedContainer(
                padding: EdgeInsets.all(RSizes.md),
                showBorder: true,
                backgroundColor: dark ? RColors.black : RColors.white,
                child: Column(
                  children: [
                    // Pricing
                    RBillingAmountSection(),
                    const SizedBox(height: RSizes.spaceBtwItems),

                    // Divider
                    const Divider(),
                    const SizedBox(height: RSizes.spaceBtwItems),


                    // Payment Method
                    const SizedBox(height: RSizes.spaceBtwItems),
                    RBillingPaymentSection(),


                    // Address
                    RBillingAddressSection(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),

      // Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(RSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: subTotal > 0 ?
            () => orderController.processOrder(totalAmount)
            : () => RLoaders.warningSnackBar(title: 'Empty Cart', message: 'Add item in the cart in order to proceed'),
            child: Text(
                'Checkout \$$totalAmount')),
      ),
    );
  }
}

