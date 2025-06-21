import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopping_app/utils/constants/colors.dart';
import 'package:shopping_app/utils/helpers/helper_function.dart';
import '../../../../../common/widgets/custom_shapes/container/rounded_container.dart';
import '../../../../../utils/constants/sizes.dart';

class RSingleAddress extends StatelessWidget {
  const RSingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = RHelperFunctions.isDarkMode(context);
    return RRoundedContainer(
      padding: EdgeInsets.all(RSizes.md),
      width: double.infinity,
      showBorder: true,
      backgroundColor: selectedAddress ? RColors.primary.withOpacity(0.5) : Colors.transparent,
      borderColor: selectedAddress ? Colors.transparent : dark ? RColors.darkerGrey : RColors.grey,
      margin: EdgeInsets.only(bottom: RSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(selectedAddress ? Iconsax.tick_circle5 : null,
            color: selectedAddress ? dark ? RColors.light : RColors.dark.withOpacity(0.6) : null),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Rahul Kashyap',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: RSizes.sm / 2),
              const Text('(+123) 456 7890', maxLines: 1, overflow: TextOverflow.ellipsis),
              const SizedBox(height: RSizes.sm / 2),
              const Text('256 California St, San Francisco, CA 94108, United States', softWrap: true),
            ],
          )
        ],
      ),
    );
  }
}
