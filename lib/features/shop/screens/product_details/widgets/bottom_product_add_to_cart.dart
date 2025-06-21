import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopping_app/common/widgets/icons/r_circular_icon.dart';
import 'package:shopping_app/utils/constants/colors.dart';
import 'package:shopping_app/utils/constants/sizes.dart';
import 'package:shopping_app/utils/helpers/helper_function.dart';

class RBottomAddToCart extends StatelessWidget {
  const RBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = RHelperFunctions.isDarkMode(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: RSizes.defaultSpace, vertical: RSizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: dark ? RColors.darkerGrey : RColors.light,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(RSizes.cardRadiusLg),
          topRight: Radius.circular(RSizes.cardRadiusLg),
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              RCircularIcon(icon: Iconsax.minus,
              backgroundColor: RColors.darkGrey,
                width: 40,
                height: 40,
                color: RColors.white,
              ),
              const SizedBox(width: RSizes.spaceBtwItems),
              Text('2', style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(width: RSizes.spaceBtwItems),

              RCircularIcon(icon: Iconsax.add,
                backgroundColor: RColors.black,
                width: 40,
                height: 40,
                color: RColors.white,
              ),
            ],
          ),
          ElevatedButton(onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(RSizes.md),
              backgroundColor: RColors.black,
              side: BorderSide(color: RColors.black),
            ),
            child: Text('Add to Cart'),
          )
        ],
      ),
    );
  }
}