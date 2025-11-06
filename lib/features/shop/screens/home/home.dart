import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/common/widgets/layouts/grid_layout.dart';
import 'package:shopping_app/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:shopping_app/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:shopping_app/features/shop/screens/home/widgets/home_categories.dart';
import 'package:shopping_app/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:shopping_app/utils/constants/sizes.dart';
import '../../../../common/widgets/custom_shapes/container/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/container/search_container.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../controls/product/product_controller.dart';
import '../all_products/all_products.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            RPrimaryHeaderContainer(
              child: Column(
                children: [
                  // Appbar
                  RHomeAppBar(),
                  const SizedBox(height: RSizes.spaceBtwSections),

                  // SearchBar
                  RSearchContainer(text: 'Search in Store'),
                  const SizedBox(height: RSizes.spaceBtwSections),

                  // Heading
                  Padding(
                    padding: EdgeInsets.only(left: RSizes.defaultSpace),
                    child: Column(
                      children: [
                        RSectionHeading(
                            title: 'Popular Categories',
                            showActionButton: false,
                            textColor: Colors.white),
                        const SizedBox(height: RSizes.spaceBtwItems),

                        // Categories
                        RHomeCategories()
                      ],
                    ),
                  ),
                  const SizedBox(height: RSizes.spaceBtwSections),
                ],
              ),
            ),

            // Body
            Padding(
              padding: const EdgeInsets.all(RSizes.defaultSpace),
              child: RPromoSlider(),
            ),
            const SizedBox(height: RSizes.spaceBtwItems),

            // Heading
            RSectionHeading(
                title: 'Popular Products',
                onPressed: () => Get.to(() => AllProducts(
                      title: 'Popular Products',
                      futureMethod: controller.fetchAllFeaturedProducts(),
                    )),
            ),
            const SizedBox(height: RSizes.spaceBtwItems),

            // Popular Products
            Obx(() {
              if (controller.isLoading.value) return const RVerticalProductShimmer();

              if (controller.featuredProducts.isEmpty) {
                return Center(
                    child: Text('No Data Found!',
                        style: Theme.of(context).textTheme.bodyMedium));
              }
              return RGridLayout(
                itemCount: controller.featuredProducts.length,
                itemBuilder: (_, index) => RProductCardVertical(
                    product: controller.featuredProducts[index]),
              );
            })
          ],
        ),
      ),
    );
  }
}
