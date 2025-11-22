import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_function.dart';
import '../../icons/r_circular_icon.dart';


class RProductQuantityWithAddRemoveButton extends StatelessWidget {
  const RProductQuantityWithAddRemoveButton({
    super.key, required this.quantity, this.add, this.remove,
  });

  final int quantity;
  final VoidCallback? add, remove;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        RCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: RSizes.md,
          color: RHelperFunctions.isDarkMode(context) ? RColors.white : RColors.black,
          backgroundColor: RHelperFunctions.isDarkMode(context) ? RColors.darkerGrey : RColors.light,
          onPressed: remove,
        ),

        const SizedBox(width: RSizes.spaceBtwItems),
        Text(quantity.toString(), style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: RSizes.spaceBtwItems),
        RCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: RSizes.md,
          color: RColors.white,
          backgroundColor: RColors.primary,
          onPressed: add,
        ),
      ],
    );
  }
}