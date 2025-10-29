import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shopping_app/common/widgets/brand_cards/brand_showcase.dart';
import 'package:shopping_app/features/shop/controls/product/brand_controller.dart';
import 'package:shopping_app/utils/helpers/cloud_helper_function.dart';

import '../../../../../common/widgets/shimmers/boxes_shimmer.dart';
import '../../../../../common/widgets/shimmers/list_tile_shimmer.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../models/category_model.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
      future: controller.getBrandsForCategory(category.id),
      builder: (context, snapshot) {

        /// Handle Loader, No Record, or Error Message
        const loader = Column(
          children: [
            RListsTileShimmer(),
            SizedBox(height: RSizes.spaceBtwItems),
            RBoxesShimmer(),
            SizedBox(height: RSizes.spaceBtwItems)
          ],
        );

         final widget = RCloudHelperFunction.checkMultiRecordState(snapshot: snapshot, loader: loader);
         if (widget != null) return widget;

         /// Record Found
          final brands = snapshot.data!;

          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: brands.length,
            itemBuilder: (_, index) {
              final brand = brands[index];
              return FutureBuilder(
                future: controller.getBrandProducts(brandId: brand.id, limit: 3),
                builder: (context, snapshot) {

                  // Handle Loader, No Record, or Error Message
                  final widget = RCloudHelperFunction.checkMultiRecordState(snapshot: snapshot, loader: loader);
                  if (widget != null) return widget;

                  /// Record Found
                  final products = snapshot.data!;

                  return RBrandShowCase(brand: brand, images: products.map((e) => e.thumbnail).toList());
                }
              );
            },
          );
      }
    );
  }
}
