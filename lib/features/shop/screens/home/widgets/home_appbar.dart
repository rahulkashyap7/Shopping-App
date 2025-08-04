import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shopping_app/features/personalization/controls/user_controller.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/product_cart/cart_menu_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/popups/shimmer.dart';

class RHomeAppBar extends StatelessWidget {
  const RHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return RAppBar(title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(RTexts.homeAppbarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: RColors.grey)),
        Obx(() {
          if (controller.profileLoading.value) {
            return const RShimmerEffect(width: 80, height: 15);
          } else {
            return Text(controller.user.value.fullName, style: Theme.of(context).textTheme.headlineSmall!.apply(color: RColors.white));
          }
        }),
      ],
    ),
      actions: [RCartCounterIcon(onPressed: () {}, iconColor: RColors.white)],
    );
  }
}