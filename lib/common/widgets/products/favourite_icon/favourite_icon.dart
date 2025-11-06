import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopping_app/common/widgets/icons/r_circular_icon.dart';
import 'package:shopping_app/utils/constants/colors.dart';

import '../../../../features/shop/controls/product/favourites_controller.dart';

class RFavouriteIcon extends StatelessWidget {
  const RFavouriteIcon({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouritesController());
    return Obx(
        () => RCircularIcon(
        icon: controller.isFavorite(productId) ? Iconsax.heart5 : Iconsax.heart,
        color: controller.isFavorite(productId) ?  RColors.error : null,
          onPressed: () => controller.toggleFavorite(productId),
    ));
  }
}
