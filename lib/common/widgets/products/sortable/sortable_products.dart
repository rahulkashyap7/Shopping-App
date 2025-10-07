import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopping_app/features/shop/models/product_model.dart';
import '../../../../utils/constants/sizes.dart';
import '../../layouts/grid_layout.dart';
import '../product_cards/product_card_vertical.dart';


class RSortableProducts extends StatelessWidget {
  const RSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // DropDown
        DropdownButtonFormField(
          decoration: InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (value) {},
          items: ['Name', 'Higher Price', 'Lower Price', 'Sale', 'Newest', 'Popularity'].map((option) => DropdownMenuItem(
              value: option,
              child: Text(option))).toList(),
        ),
        const SizedBox(height: RSizes.spaceBtwSections),

        // Products
        RGridLayout(itemCount: 8, itemBuilder: (_, index) => RProductCardVertical(product: ProductModel.empty())),
      ],
    );
  }
}