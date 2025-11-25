import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shopping_app/common/widgets/loaders/loaders.dart';
import 'package:shopping_app/common/widgets/success_screen/success_screen.dart';
import 'package:shopping_app/data/repositories/authentication/authentication_repository.dart';
import 'package:shopping_app/features/shop/controls/product/checkout_controller.dart';
import 'package:shopping_app/navigation_menu.dart';
import 'package:shopping_app/utils/constants/enums.dart';
import 'package:shopping_app/utils/constants/image_strings.dart';
import 'package:shopping_app/utils/popups/full_screen_loader.dart';
import '../../../../data/repositories/order_repository/order_repository.dart';
import '../../../personalization/controls/address_controller.dart';
import '../../models/order_model.dart';
import 'cart_controller.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  /// Variables
  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;
  final orderRepository = Get.put(OrderRepository());

  /// Fetch user's order history
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userOrders = await orderRepository.fetchUserOrders();
      return userOrders;
    } catch (e) {
      RLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  /// Add methods for Order Processing
  void processOrder(double totalAmount) async {
    try {
      // Start Loading
      RFullScreenLoader.openLoadingDialog(
          'Processing your order', RImages.pencilAnimation);

      // Get user Auth id
      final userId = AuthenticationRepository.instance.authUser?.uid;
      if (userId == null || userId.isEmpty) return;

      // Add details
      final order = OrderModel(
        // Generate a unique ID for the order
        id: UniqueKey().toString(), // you can generate any id for order id
        userId: userId,
        status: OrderStatus.pending,
        totalAmount: totalAmount,
        orderDate: DateTime.now(),
        paymentMethod: checkoutController.selectedPaymentMethod.value.name,
        address: addressController.selectedAddress.value,
        // Set date as needed
        deliveryDate: DateTime.now(),
        items: cartController.cartItems.toList(),
      );

      // Save the order to firestore
      await orderRepository.saveOrder(order, userId);

      // update the cart status
      cartController.clearCart();

      // Show success screen
      Get.off(() => SuccessScreen(
            image: RImages.orderCompletedAnimation,
            title: 'Payment Success',
            subtitle: 'Your item will shipped soon.',
            onPressed: () => Get.offAll(() => NavigationMenu()),
          ));
    } catch (e) {
      RLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
