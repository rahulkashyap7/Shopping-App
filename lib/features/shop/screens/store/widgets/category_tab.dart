import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shopping_app/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:shopping_app/common/widgets/texts/section_heading.dart';
import 'package:shopping_app/features/shop/controls/category_controller.dart';
import 'package:shopping_app/features/shop/models/category_model.dart';
import 'package:shopping_app/features/shop/screens/all_products/all_products.dart';
import 'package:shopping_app/features/shop/screens/store/widgets/category_brands.dart';
import '../../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../../utils/constants/sizes.dart';

class RCategoryTab extends StatelessWidget {
  const RCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.all(RSizes.defaultSpace),
            child: Column(
              children: [
                // Brands
                CategoryBrands(category: category),
                const SizedBox(height: RSizes.spaceBtwItems),

                // Products
                FutureBuilder(
                    future:
                        controller.getCategoryProducts(categoryId: category.id),
                    builder: (context, snapshot) {
                      // Show loader while waiting
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const RVerticalProductShimmer();
                      }

                      // Show error if present
                      if (snapshot.hasError) {
                        return const Center(
                            child: Text('Something went wrong.'));
                      }

                      // Get products data
                      final products = snapshot.data;

                      // Show "No Data Found!" if no products
                      if (products == null || products.isEmpty) {
                        return Center(
                          child: Text('No Data Found!',
                              style: Theme.of(context).textTheme.bodyMedium),
                        );
                      }

                      // Record found!
                      return Column(
                        children: [
                          RSectionHeading(
                              title: 'You might like',
                              onPressed: () => Get.to(AllProducts(
                                    title: category.name,
                                    futureMethod:
                                        controller.getCategoryProducts(
                                            categoryId: category.id, limit: -1),
                                  ))),
                          const SizedBox(height: RSizes.spaceBtwItems),
                          RGridLayout(
                              itemCount: products.length,
                              itemBuilder: (_, index) => RProductCardVertical(
                                  product: products[index])),
                        ],
                      );
                    }),
              ],
            ),
          ),
        ]);
  }
}
