import 'package:flutter/cupertino.dart';
import 'package:shopping_app/common/widgets/brand_cards/brand_showcase.dart';
import 'package:shopping_app/features/shop/controls/product/brand_controller.dart';

import '../../../../../common/widgets/shimmers/boxes_shimmer.dart';
import '../../../../../common/widgets/shimmers/list_tile_shimmer.dart';
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
          /// Handle Loader or Error Message
          const loader = Column(
            children: [
              RListsTileShimmer(),
              SizedBox(height: RSizes.spaceBtwItems),
              RBoxesShimmer(),
              SizedBox(height: RSizes.spaceBtwItems)
            ],
          );

          // Show loader while waiting
          if (snapshot.connectionState == ConnectionState.waiting) {
            return loader;
          }

          // Show error if present
          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong.'));
          }

          // Get brands data
          final brands = snapshot.data;

          // If no brands found, return empty widget with no spacing
          if (brands == null || brands.isEmpty) {
            return const SizedBox.shrink();
          }

          /// Record Found - Show brands
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: brands.length,
            itemBuilder: (_, index) {
              final brand = brands[index];
              return FutureBuilder(
                  future:
                      controller.getBrandProducts(brandId: brand.id, limit: 3),
                  builder: (context, snapshot) {
                    // Handle Loader
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return loader;
                    }

                    // Handle Error
                    if (snapshot.hasError) {
                      return const SizedBox
                          .shrink(); // Hide error for individual brand
                    }

                    /// Record Found or Empty
                    final products = snapshot.data;

                    if (products == null || products.isEmpty) {
                      return const SizedBox
                          .shrink(); // Hide empty brand showcases
                    }

                    return RBrandShowCase(
                        brand: brand,
                        images: products.map((e) => e.thumbnail).toList());
                  });
            },
          );
        });
  }
}
