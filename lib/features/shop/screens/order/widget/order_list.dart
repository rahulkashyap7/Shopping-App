import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopping_app/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:shopping_app/utils/constants/colors.dart';
import 'package:shopping_app/utils/constants/sizes.dart';
import 'package:shopping_app/utils/helpers/helper_function.dart';

class ROrderListItems extends StatelessWidget {
  const ROrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = RHelperFunctions.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 5,
      separatorBuilder: (_, __) => const SizedBox(height: RSizes.spaceBtwItems),
      itemBuilder: (_, index) => RRoundedContainer(
        showBorder: true,
        padding: EdgeInsets.all(RSizes.md),
        backgroundColor: dark ? RColors.dark : RColors.light,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Row 1
            Row(
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
                      Text(
                        'Processing',
                        style: Theme.of(context).textTheme.bodyLarge!.apply(color: RColors.primary, fontWeightDelta: 1),
                      ),
                      Text('04 March 2025', style: Theme.of(context).textTheme.headlineSmall),
                    ],
                  ),
                ),

                // Icon
                IconButton(onPressed: () {}, icon: Icon(Iconsax.arrow_right_34, size: RSizes.iconSm)),
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
                            Text('Order', style: Theme.of(context).textTheme.labelMedium),
                            Text('[#256f2]', style: Theme.of(context).textTheme.titleMedium),
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
                            Text('Shipping Date', style: Theme.of(context).textTheme.labelMedium),
                            Text('10 March 2025', style: Theme.of(context).textTheme.titleMedium),
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
      ),
    );
  }
}
