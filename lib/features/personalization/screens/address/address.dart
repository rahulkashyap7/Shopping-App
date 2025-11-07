import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopping_app/common/widgets/appbar/appbar.dart';
import 'package:shopping_app/features/personalization/controls/address_controller.dart';
import 'package:shopping_app/features/personalization/screens/address/add_new_address.dart';
import 'package:shopping_app/features/personalization/screens/address/widgets/single_address.dart';
import 'package:shopping_app/utils/constants/colors.dart';
import 'package:shopping_app/utils/constants/sizes.dart';
import 'package:shopping_app/utils/helpers/cloud_helper_function.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(AddressController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: RColors.primary,
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        child: Icon(Iconsax.add, color: RColors.white),
      ),

      appBar: RAppBar(showBackArrow: true, title: Text('Addresses', style: Theme.of(context).textTheme.headlineSmall)),

      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(RSizes.defaultSpace),
        child: Obx(
          () => FutureBuilder(
            key: Key(controller.refreshData.value.toString()),
            future: controller.getAllUserAddress(),
            builder: (context, snapshot) {

                  /// Helper function: Handle Loader, No Record, or Error Message
                  final response = RCloudHelperFunction.checkMultiRecordState(snapshot: snapshot);
                  if (response != null) return response;

                  final addresses = snapshot.data!;
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: addresses.length,
                      itemBuilder: (_, index) => RSingleAddress(address: addresses[index], onTap: () => controller.selectAddress(addresses[index])));
                }),
        ),
        ),
      ),
    );
  }
}
