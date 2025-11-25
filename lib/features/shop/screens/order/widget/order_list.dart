import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopping_app/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:shopping_app/common/widgets/loaders/animation_loader.dart';
import 'package:shopping_app/features/shop/controls/product/order_controller.dart';
import 'package:shopping_app/navigation_menu.dart';
import 'package:shopping_app/utils/constants/colors.dart';
import 'package:shopping_app/utils/constants/image_strings.dart';
import 'package:shopping_app/utils/constants/sizes.dart';
import 'package:shopping_app/utils/helpers/cloud_helper_function.dart';
import 'package:shopping_app/utils/helpers/helper_function.dart';

class ROrderListItems extends StatelessWidget {
  const ROrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderController());
    final dark = RHelperFunctions.isDarkMode(context);
    return FutureBuilder(
        future: controller.fetchUserOrders(),
        builder: (_, snapshot) {
          /// Nothing Found
          final emptyWidget = RAnimationLoaderWidget(
            text: 'Whoops no order yet!',
            animation: RImages.orderCompletedAnimation,
            showActon: true,
            actionText: 'Let\'s fill it',
            onActionPressed: () => Get.off(() => NavigationMenu()),
          );

          /// Helper Function: Handle loader, no record, Or error message
          final response = RCloudHelperFunction.checkMultiRecordState(
              snapshot: snapshot, nothingFound: emptyWidget);
          if (response != null) return response;

          /// Congrats Record found.
          final orders = snapshot.data!;
          return ListView.separated(
            shrinkWrap: true,
            itemCount: orders.length,
            separatorBuilder: (_, __) =>
                const SizedBox(height: RSizes.spaceBtwItems),
            itemBuilder: (_, index) {
              final order = orders[index];
              return RRoundedContainer(
                showBorder: true,
                padding: EdgeInsets.all(RSizes.md),
                backgroundColor: dark ? RColors.dark : RColors.light,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //  Top Row 1
                    Row(
                      children: [
                        // 1- image
                        Icon(Iconsax.ship),
                        SizedBox(width: RSizes.spaceBtwItems / 2),

                        // Status and Date
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                order.orderStatusText,
                                style: Theme.of(context).textTheme.bodyLarge!.apply(
                                    color: RColors.primary,
                                    fontWeightDelta: 1),
                              ),
                              Text(order.formattedOrderDate,
                                  style:
                                  Theme.of(context).textTheme.headlineSmall),
                            ],
                          ),
                        ),

                        // Icon
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Iconsax.arrow_right_34,
                                size: RSizes.iconSm)),
                      ],
                    ),
                    const SizedBox(height: RSizes.spaceBtwItems),

                    // Row 2
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              // Icon
                              Icon(Iconsax.ship),
                              SizedBox(width: RSizes.spaceBtwItems / 2),

                              // Status and Date
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Order',
                                        style: Theme.of(context).textTheme.labelMedium),
                                    Text(order.id,
                                        style: Theme.of(context).textTheme.titleMedium),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              // Icon
                              Icon(Iconsax.calendar),
                              SizedBox(width: RSizes.spaceBtwItems / 2),

                              // Status and Date
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Shipping Date',
                                        style: Theme.of(context).textTheme.labelMedium),
                                    Text(order.formattedDeliveryDate,
                                        style: Theme.of(context).textTheme.titleMedium),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        });
  }
}
