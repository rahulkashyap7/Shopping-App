import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/common/widgets/appbar/appbar.dart';
import 'package:shopping_app/common/widgets/brand_cards/r_brand_card.dart';
import 'package:shopping_app/common/widgets/layouts/grid_layout.dart';
import 'package:shopping_app/common/widgets/texts/section_heading.dart';
import 'package:shopping_app/features/shop/controls/product/brand_controller.dart';
import 'package:shopping_app/features/shop/screens/brands/brand_products.dart';
import 'package:shopping_app/utils/constants/sizes.dart';

import '../../../../common/widgets/shimmers/brand_shimmer.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;
    return Scaffold(
      appBar: RAppBar(title: Text('Brand'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(RSizes.defaultSpace),
          child: Column(
            children: [
              // Heading
              RSectionHeading(title: 'Brands', showActionButton: false),
              SizedBox(height: RSizes.spaceBtwItems),

              ///--Brands Grid
              Obx(() {
                if (brandController.isLoading.value) return RBrandShimmer();

                if (brandController.allBrands.isEmpty) {
                  return Center(
                    child: Text('No Data Found!',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .apply(color: Colors.white)),
                  );
                }

                return RGridLayout(
                    itemCount: brandController.allBrands.length,
                    mainAxisExtent: 80,
                    itemBuilder: (_, index) {
                      final brand = brandController.allBrands[index];

                      return RBrandCard(showBorder: true, brand: brand,
                      onTap: () => Get.to(() => BrandProducts(brand: brand,)));
                    });
              }),
            ],
          ),
        ),
      ),
    );
  }
}
