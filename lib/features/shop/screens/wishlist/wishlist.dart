import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopping_app/common/widgets/appbar/appbar.dart';
import 'package:shopping_app/common/widgets/icons/r_circular_icon.dart';
import 'package:shopping_app/common/widgets/layouts/grid_layout.dart';
import 'package:shopping_app/common/widgets/loaders/animation_loader.dart';
import 'package:shopping_app/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:shopping_app/features/shop/controls/product/favourites_controller.dart';
import 'package:shopping_app/features/shop/screens/home/home.dart';
import 'package:shopping_app/navigation_menu.dart';
import 'package:shopping_app/utils/constants/image_strings.dart';
import 'package:shopping_app/utils/constants/sizes.dart';
import 'package:shopping_app/utils/helpers/cloud_helper_function.dart';

import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';

class FevouriteScreen extends StatelessWidget {
  const FevouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavouritesController.instance;
    return Scaffold(
      appBar: RAppBar(
        title: Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          RCircularIcon(icon: Iconsax.add, onPressed: () => Get.to(const HomeScreen())),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(RSizes.defaultSpace),

          /// Product Grid
          child: Obx(
              ()=> FutureBuilder(
              future: controller.favoriteProducts(),
              builder: (context, snapshot) {

                /// Nothing Found Widget
                final emptyWidget = RAnimationLoaderWidget(
                  text: 'Whoops! Wishlist is Empty...',
                  animation: RImages.pencilAnimation,
                  showActon: true,
                  actionText: 'Let\'s add some',
                  onActionPressed: () => Get.off(()=> NavigationMenu()),
                );

                const loader = RVerticalProductShimmer(itemCount: 6);
                final widget = RCloudHelperFunction.checkMultiRecordState(snapshot: snapshot, loader: loader, nothingFound: emptyWidget);
                if (widget != null) return widget;

                final products = snapshot.data!;
                return RGridLayout(
                    itemCount: products.length,
                    itemBuilder: (_, index) =>
                        RProductCardVertical(product: products[index]));
              }
            ),
          ),
        ),
      ),
    );
  }
}
