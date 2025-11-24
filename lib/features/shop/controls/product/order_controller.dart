import 'package:get/get.dart';
import 'package:shopping_app/features/shop/controls/product/checkout_controller.dart';

import '../../../personalization/controls/address_controller.dart';
import 'cart_controller.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();
  
  /// Variables
  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;
  final orderRepository = Get.put(OrderRepository());


  /// Fetch user's order history

  /// Add methods for Order Processing
}