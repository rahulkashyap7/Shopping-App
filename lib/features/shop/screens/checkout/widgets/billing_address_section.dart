import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/common/widgets/texts/section_heading.dart';
import 'package:shopping_app/features/personalization/controls/address_controller.dart';
import 'package:shopping_app/utils/constants/sizes.dart';

class RBillingAddressSection extends StatelessWidget {
  const RBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final addressController = AddressController.instance;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RSectionHeading(
            title: 'Shipping Address',
            buttonTitle: 'Change',
            onPressed: () => addressController.selectNewAddressPopup(context)),
        Obx(() => addressController.selectedAddress.value.id.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(addressController.selectedAddress.value.name,
                      style: Theme.of(context).textTheme.bodyLarge),
                  const SizedBox(height: RSizes.spaceBtwItems / 2),
                  Row(
                    children: [
                      const Icon(Icons.phone, color: Colors.grey, size: 16),
                      const SizedBox(width: RSizes.spaceBtwItems),
                      Text(
                          addressController
                              .selectedAddress.value.formattedPhoneNo,
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                  const SizedBox(height: RSizes.spaceBtwItems / 2),
                  Row(
                    children: [
                      const Icon(Icons.location_history,
                          color: Colors.grey, size: 16),
                      const SizedBox(width: RSizes.spaceBtwItems),
                      Expanded(
                          child: Text(
                              addressController.selectedAddress.value
                                  .toString(),
                              style: Theme.of(context).textTheme.bodyMedium,
                              softWrap: true)),
                    ],
                  ),
                ],
              )
            : Text('Select Address',
                style: Theme.of(context).textTheme.bodyMedium)),
      ],
    );
  }
}
