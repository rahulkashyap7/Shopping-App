import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopping_app/features/personalization/controls/address_controller.dart';
import 'package:shopping_app/features/personalization/models/address_model.dart';
import 'package:shopping_app/utils/constants/colors.dart';
import 'package:shopping_app/utils/helpers/helper_function.dart';
import '../../../../../common/widgets/custom_shapes/container/rounded_container.dart';
import '../../../../../utils/constants/sizes.dart';

class RSingleAddress extends StatelessWidget {
  const RSingleAddress({
    super.key,
    required this.address,
    required this.onTap,
  });

  final AddressModel address;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;

    final dark = RHelperFunctions.isDarkMode(context);

    return Obx(
      () {
        final selectedAddressId = controller.selectedAddress.value.id;
        final selectedAddress = selectedAddressId == address.id;
        return Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: RRoundedContainer(
              padding: EdgeInsets.all(RSizes.md),
              width: double.infinity,
              showBorder: true,
              backgroundColor: selectedAddress
                  ? RColors.primary.withOpacity(0.5)
                  : Colors.transparent,
              borderColor: selectedAddress
                  ? Colors.transparent
                  : dark
                      ? RColors.darkerGrey
                      : RColors.grey,
              margin: EdgeInsets.only(bottom: RSizes.spaceBtwItems),
              child: Stack(
                children: [
                  Positioned(
                    right: 5,
                    top: 0,
                    child: Icon(selectedAddress ? Iconsax.tick_circle5 : null,
                        color: selectedAddress
                            ? dark
                                ? RColors.light
                                : RColors.dark.withOpacity(0.6)
                            : null),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        address.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: RSizes.sm / 2),
                      Text(address.formattedPhoneNo,
                          maxLines: 1, overflow: TextOverflow.ellipsis),
                      const SizedBox(height: RSizes.sm / 2),
                      Text(address.toString(), softWrap: true),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
