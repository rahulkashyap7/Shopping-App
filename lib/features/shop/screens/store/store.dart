import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/common/widgets/appbar/appbar.dart';
import 'package:shopping_app/common/widgets/appbar/tabbar.dart';
import 'package:shopping_app/common/widgets/custom_shapes/container/search_container.dart';
import 'package:shopping_app/common/widgets/layouts/grid_layout.dart';
import 'package:shopping_app/common/widgets/product_cart/cart_menu_icon.dart';
import 'package:shopping_app/common/widgets/texts/section_heading.dart';
import 'package:shopping_app/features/shop/screens/store/widgets/category_tab.dart';
import 'package:shopping_app/utils/constants/colors.dart';
import 'package:shopping_app/utils/constants/sizes.dart';
import 'package:shopping_app/utils/helpers/helper_function.dart';
import '../../../../common/widgets/brand_cards/r_brand_card.dart';
import '../brands/all_brands.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: RAppBar(
          title:
              Text('Store', style: Theme.of(context).textTheme.headlineMedium),
          actions: [
            RCartCounterIcon(onPressed: () {}),
          ],
        ),
        body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                    automaticallyImplyLeading: false,
                    pinned: true,
                    floating: true,
                    backgroundColor: RHelperFunctions.isDarkMode(context)
                        ? RColors.black
                        : RColors.white,
                    expandedHeight: 440,
                    flexibleSpace: Padding(
                      padding: EdgeInsets.all(RSizes.defaultSpace),
                      child: ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          // Search Bar
                          SizedBox(height: RSizes.spaceBtwItems),
                          RSearchContainer(
                              text: 'Search in Store',
                              showBorder: true,
                              showBackground: false,
                              padding: EdgeInsets.zero),
                          SizedBox(height: RSizes.spaceBtwSections),

                          // Featured brands
                          RSectionHeading(
                              title: 'Featured Brands',
                              showActionButton: true,
                              onPressed: () => Get.to(() => const AllBrandsScreen())),
                          const SizedBox(height: RSizes.spaceBtwItems / 1.5),

                          RGridLayout(
                              itemCount: 4,
                              mainAxisExtent: 80,
                              itemBuilder: (_, index) {
                                return const RBrandCard(showBorder: true);
                              }),
                        ],
                      ),
                    ),

                    // Tabs
                    bottom: RTabBar(tabs: [
                      Tab(child: Text('Sports')),
                      Tab(child: Text('Furniture')),
                      Tab(child: Text('Electronics')),
                      Tab(child: Text('Clothes')),
                      Tab(child: Text('Cosmetics')),
                    ]))
              ];
            },
            body: const TabBarView(children: [RCategoryTab(), RCategoryTab(), RCategoryTab(), RCategoryTab(), RCategoryTab(),
            ]
          ),
        ),
      ),
    );
  }
}
