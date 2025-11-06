import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shopping_app/common/widgets/appbar/appbar.dart';
import 'package:shopping_app/common/widgets/images/R_rounded_image.dart';
import 'package:shopping_app/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:shopping_app/common/widgets/texts/section_heading.dart';
import 'package:shopping_app/features/shop/controls/category_controller.dart';
import 'package:shopping_app/features/shop/models/category_model.dart';
import 'package:shopping_app/features/shop/screens/all_products/all_products.dart';
import 'package:shopping_app/utils/constants/image_strings.dart';
import 'package:shopping_app/utils/constants/sizes.dart';
import 'package:shopping_app/utils/helpers/cloud_helper_function.dart';

import '../../../../common/widgets/shimmers/horizontal_product_shimmer.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return Scaffold(
      appBar: RAppBar(title: Text(category.name), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(RSizes.defaultSpace),
          child: Column(
            children: [
              // Banner
              RRoundedImage(
                  width: double.infinity,
                  imageUrl: RImages.promoBanner1,
                  applyImageRadius: true),
              const SizedBox(height: RSizes.spaceBtwSections),

              // Sub-Categories
              FutureBuilder(
                  future: controller.getSubCategories(category.id),
                  builder: (context, snapshot) {
                    /// Handle Loader, no record or Error message
                    const loader = RHorizontalProductShimmer();
                    final widget = RCloudHelperFunction.checkMultiRecordState(
                        snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;

                    /// Record Found
                    final subCategories = snapshot.data!;

                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: subCategories.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index) {
                        final subCategory = subCategories[index];

                        return FutureBuilder(
                            future: controller.getCategoryProducts(
                                categoryId: subCategory.id),
                            builder: (context, snapshot) {
                              /// Handle Loader, no record or Error message
                              final widget =
                                  RCloudHelperFunction.checkMultiRecordState(
                                      snapshot: snapshot, loader: loader);
                              if (widget != null) return widget;

                              /// congrats Record Found
                              final products = snapshot.data!;

                              return Column(
                                children: [
                                  // Heading
                                  RSectionHeading(
                                      title: subCategory.name,
                                      onPressed: () => Get.to(
                                            () => AllProducts(title: subCategory.name,
                                              futureMethod: controller.getCategoryProducts(categoryId: subCategory.id, limit: -1),
                                            ),
                                          )),
                                  const SizedBox(
                                      height: RSizes.spaceBtwItems / 2),

                                  SizedBox(
                                    height: 120,
                                    child: ListView.separated(
                                        itemCount: products.length,
                                        scrollDirection: Axis.horizontal,
                                        separatorBuilder: (context, index) =>
                                            SizedBox(
                                                width: RSizes.spaceBtwItems),
                                        itemBuilder: (context, index) =>
                                            RProductCardHorizontal(product: products[index])),
                                  ),

                                  const SizedBox(height: RSizes.spaceBtwSections),
                                ],
                              );
                            });
                      },
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
