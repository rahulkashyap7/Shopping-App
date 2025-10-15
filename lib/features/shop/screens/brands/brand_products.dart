import 'package:flutter/material.dart';
import 'package:shopping_app/common/widgets/appbar/appbar.dart';
import 'package:shopping_app/common/widgets/brand_cards/r_brand_card.dart';
import 'package:shopping_app/common/widgets/products/sortable/sortable_products.dart';
import 'package:shopping_app/utils/constants/sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RAppBar(title: Text('Nike'), showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(RSizes.defaultSpace),
        child: Column(
          children: [
            // Brand Detail
            RBrandCard(showBorder: true),
            SizedBox(height: RSizes.spaceBtwSections),

            RSortableProducts(products: [],),
          ],
        ),
        ),
      ),
    );
  }
}
