import 'package:get/get.dart';
import 'package:shopping_app/common/widgets/loaders/loaders.dart';
import 'package:shopping_app/features/shop/controls/product/variation_controller.dart';
import 'package:shopping_app/utils/local_storage/storage_utility.dart';
import '../../models/cart_item_model.dart';
import '../../models/product_model.dart';

class CartController extends GetxController {
  static  CartController get instance => Get.find();

  // Variables
  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  final variationController = VariationController.instance;

  CartController() {
    loadCartItems();
  }

  // Add Item in cart
  void addToCart(ProductModel product) {
    // Quantity Check
    if (productQuantityInCart.value < 1){
      RLoaders.customToast(message: 'Select Quantity');
      return;
    }

    // Variation Selected?
    if(product.productType == ProductType.variable.toString() && variationController.selectedVariation.value.id.isEmpty){
      RLoaders.customToast(message: 'Select Variation');
      return;
    }

    // Out of stock status
    if(product.productType == ProductType.variable.toString()) {
      if (variationController.selectedVariation.value.stock < 1){
        RLoaders.warningSnackBar(title: 'Oh Snap!', message: 'Selected Variation is out of stock.');
        return;
      }
    } else {
      if (product.stock < 1){
        RLoaders.warningSnackBar(title: 'Oh Snap!', message: 'Selected Product is Out of stock.');
        return;
      }
    }

    // Convert the ProductModel to a CartItemModel with the given quantity
    final selectedCartItem = convertToCartItem(product, productQuantityInCart.value);

    // check if already added in the cart
    int index = cartItems.indexWhere((cartItem) => cartItem.productId ==  selectedCartItem.productId && cartItem.variationId == selectedCartItem.variationId);

    if(index >= 0){
      // This quantity is already added or Updated/Removed from the design (Cart)(-)
      cartItems[index].quantity = selectedCartItem.quantity;
    } else {
      cartItems.add(selectedCartItem);
    }

    updateCart();
    RLoaders.customToast(message: 'Your product has been added to the Cart.');
  }

  void addOneToCart(CartItemModel item) {
    int index = cartItems.indexWhere((cartItem) => cartItem.productId == item.productId && cartItem.variationId == item.variationId);

    if (index >= 0) {
      cartItems[index].quantity += 1;
    } else {
      cartItems.add(item);
    }

    updateCart();
  }

  void removeOneToCart(CartItemModel item) {
    int index = cartItems.indexWhere((cartItem) =>
    cartItem.productId == item.productId &&
        cartItem.variationId == item.variationId);

    if (index >= 0) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity -= 1;
      } else {
      // Show dialog before completely removing
      cartItems[index].quantity == 1 ? removeFromCartDialog(index) : cartItems.removeAt(index);
      }

      updateCart ();
    }
  }

  void removeFromCartDialog(int index) {
    Get.defaultDialog(
      title: 'Remove Products',
      middleText: 'Are you sure you want to remove this product?',
      onConfirm: () {
        // Remove the item from the cart
        cartItems.removeAt(index);
        updateCart();
        RLoaders.customToast(message: 'Product Removed from the cart.');
        Get.back();
      },
      onCancel: () => () => Get.back(),
    );
  }

  /// -- Initialize already added Item's Count in the cart.
  void updateAlreadyAddedProductCount(ProductModel product) {
    // if product has no variation then calculate cartEntries and display total number.
    // Else make default entries to 0 and show cartEntries when variation is selected.
    if (product.productType == ProductType.single.toString()) {
      productQuantityInCart.value = getProductQuantityInCart(product.id);
    } else {
      // Get selected variable if any..
      final variationId = variationController.selectedVariation.value.id;
      if (variationId.isNotEmpty) {
        productQuantityInCart.value = getVariationQuantityInCart(product.id, variationId);
      } else {
        productQuantityInCart.value = 0;
      }
    }
  }


  /// This function converts a ProductModel to a CartItemModel
  CartItemModel convertToCartItem(ProductModel product, int quantity) {
    if(product.productType == ProductType.single.toString()) {
      // Reset Variation in case of single product type.
      variationController.resetSelectedAttributes();
    }

    final variation = variationController.selectedVariation.value;
    final isVariation = variation.id.isEmpty;
    final price = isVariation ? variation.salePrice > 0.0 ? variation.salePrice : variation.price : product.salePrice > 0.0 ? product.salePrice : product.price;

    return CartItemModel(
      productId: product.id,
      title: product.title,
      price: price,
      quantity: quantity,
      variationId: variation.id,
      image: isVariation ? variation.image : product.thumbnail,
      brandName: product.brand != null ? product.brand!.name : '',
      selectedVariation: isVariation ? variation.attributeValues : null,
    );
  }

  /// Update cart values
  void updateCart() {
    updateCartTotals();
    saveCartItems();
    cartItems.refresh();
  }

  void updateCartTotals() {
    double calculatedTotalPrice = 0.0;
    int calculateNoOfItems = 0;

    for (var item in cartItems) {
      calculatedTotalPrice += (item.price) * item.quantity.toDouble();
      calculateNoOfItems += item.quantity;
    }

    totalCartPrice.value = calculatedTotalPrice;
    noOfCartItems.value = calculateNoOfItems;
  }

  void saveCartItems() {
    final cartItemStrings = cartItems.map((item) => item.toJson()).toList();
    RLocalStorage.instance().saveData('cartItems', cartItemStrings);
  }

  void loadCartItems() {
    final cartItmStrings = RLocalStorage.instance().readData<List<dynamic>>('cartItems');
    if (cartItmStrings != null) {
      cartItems.assignAll(cartItmStrings.map((item) => CartItemModel.fromJson(item as Map<String, dynamic>)));
      updateCartTotals();
    }
  }

  int getProductQuantityInCart(String productId) {
    final foundItem = cartItems.where((item) => item.productId == productId).fold(0, (previousValue, element) => previousValue + element.quantity);
    return foundItem;
  }

  int getVariationQuantityInCart(String productId, String variationId) {
    final foundItem = cartItems.firstWhere((item) => item.productId == productId && item.variationId == variationId,
    orElse: () => CartItemModel.empty(),
    );
    return foundItem.quantity;
  }

  void clearCart() {
    productQuantityInCart.value = 0;
    cartItems.clear();
    updateCart();
  }
}