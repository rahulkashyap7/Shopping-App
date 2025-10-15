import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopping_app/features/shop/controls/all_product_controller.dart';
import 'package:shopping_app/features/shop/models/product_model.dart';
import '../../../../utils/constants/sizes.dart';
import '../../layouts/grid_layout.dart';
import '../product_cards/product_card_vertical.dart';


class RSortableProducts extends StatelessWidget {
  const RSortableProducts({
    super.key, required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    // initialize controller for managing product sorting
    final controller = Get.put(AllProductsController());
    controller.assignProducts(products);
    return Column(
      children: [
        /// DropDown
        DropdownButtonFormField(
          decoration: InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          value: controller.selectedSortOption.value,
          onChanged: (value) {
            // Sort products based on the selected option
            controller.sortProducts(value!);
          },
          items: ['Name', 'Higher Price', 'Lower Price', 'Sale', 'Newest', 'Popularity'].map((option) => DropdownMenuItem(
              value: option,
              child: Text(option))).toList(),
        ),
        const SizedBox(height: RSizes.spaceBtwSections),

        /// Products
        Obx(() => RGridLayout(itemCount: controller.products.length, itemBuilder: (_, index) => RProductCardVertical(product: controller.products[index]))),
      ],
    );
  }
}