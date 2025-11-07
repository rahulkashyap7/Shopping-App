import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopping_app/common/widgets/appbar/appbar.dart';
import 'package:shopping_app/features/personalization/controls/address_controller.dart';
import 'package:shopping_app/utils/constants/sizes.dart';
import 'package:shopping_app/utils/validators/validation.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    return Scaffold(
      appBar: RAppBar(showBackArrow: true, title: Text('Add New Address')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(RSizes.defaultSpace),
          child: Form(
            key: controller.addressFormKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.name,
                  validator: (value) => RValidator.validateEmptyText('Name', value),
                  decoration: InputDecoration(prefixIcon: Icon(Iconsax.user), labelText: 'Name'),
                ),
                const SizedBox(height: RSizes.spaceBtwInputFields),
              TextFormField(
                controller: controller.phoneNumber,
                validator: (value) => RValidator.validatePhoneNumber(value),
                decoration: InputDecoration(prefixIcon: Icon(Iconsax.mobile), labelText: 'Phone Number'),
              ),
                const SizedBox(height: RSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(child: TextFormField(
                      controller: controller.street,
                      validator: (value) => RValidator.validateEmptyText('Street', value),
                      decoration: InputDecoration(prefixIcon: Icon(Iconsax.building_31), labelText: 'Street'),
                    ),),
                    const SizedBox(width: RSizes.spaceBtwInputFields),
                    Expanded(child: TextFormField(
                      controller: controller.postalCode,
                      validator: (value) => RValidator.validateEmptyText('Postal Code', value),
                      decoration: InputDecoration(prefixIcon: Icon(Iconsax.code), labelText: 'Postal Code'),
                    ),),
                  ],
                ),
                const SizedBox(height: RSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(child: TextFormField(
                      controller: controller.city,
                      validator: (value) => RValidator.validateEmptyText('City', value),
                      decoration: InputDecoration(prefixIcon: Icon(Iconsax.building), labelText: 'City'),
                    ),),
                    const SizedBox(width: RSizes.spaceBtwInputFields),
                    Expanded(child: TextFormField(
                      controller: controller.state,
                      validator: (value) => RValidator.validateEmptyText('State', value),
                      decoration: InputDecoration(prefixIcon: Icon(Iconsax.activity), labelText: 'State'),
                    ),),
                  ],
                ),
                const SizedBox(height: RSizes.spaceBtwInputFields),
              TextFormField(
                controller: controller.country,
                validator: (value) => RValidator.validateEmptyText('Country', value),
                decoration: InputDecoration(prefixIcon: Icon(Iconsax.global), labelText: 'Country'),
              ),
                const SizedBox(height: RSizes.defaultSpace),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: controller.addNewAddresses,
                    child: const Text('Save'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
