import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopping_app/common/widgets/appbar/appbar.dart';
import 'package:shopping_app/common/widgets/icons/r_circular_icon.dart';
import 'package:shopping_app/common/widgets/layouts/grid_layout.dart';
import 'package:shopping_app/features/shop/screens/home/home.dart';
import 'package:shopping_app/utils/constants/sizes.dart';

import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';

class FevouriteScreen extends StatelessWidget {
  const FevouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RAppBar(
        title: Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          RCircularIcon(icon: Iconsax.add, onPressed: () => Get.to(const HomeScreen())),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(RSizes.defaultSpace),
          child: Column(
            children: [
              RGridLayout(itemCount: 5, itemBuilder: (_, index) => RProductCardVertical()),
            ],
          ),
        ),
      ),
    );
  }
}
