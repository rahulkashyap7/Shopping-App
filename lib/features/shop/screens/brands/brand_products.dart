import 'package:flutter/material.dart';
import 'package:shopping_app/common/widgets/appbar/appbar.dart';
import 'package:shopping_app/common/widgets/brand_cards/r_brand_card.dart';
import 'package:shopping_app/common/widgets/products/sortable/sortable_products.dart';
import 'package:shopping_app/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:shopping_app/features/shop/controls/product/brand_controller.dart';
import 'package:shopping_app/features/shop/models/brand_model.dart';
import 'package:shopping_app/utils/constants/sizes.dart';
import 'package:shopping_app/utils/helpers/cloud_helper_function.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});

  final BrandModel brand;
  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: RAppBar(title: Text(brand.name), showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(RSizes.defaultSpace),
        child: Column(
          children: [
            // Brand Detail
            RBrandCard(showBorder: true, brand: brand),
            SizedBox(height: RSizes.spaceBtwSections),

            FutureBuilder(
              future: controller.getBrandProducts(brand.id),
              builder: (context, snapshot) {

                // Handle Loader, No record, OR error Message
                const loader = RVerticalProductShimmer();
                final widget = RCloudHelperFunction.checkMultiRecordState(snapshot: snapshot, loader: loader);
                if (widget != null) return widget;

                /// Record Found!
                final brandProducts = snapshot.data!;
                return RSortableProducts(products: brandProducts);
              }
            ),
          ],
        ),
        ),
      ),
    );
  }
}
