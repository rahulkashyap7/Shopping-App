import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/common/widgets/loaders/loaders.dart';
import 'package:shopping_app/features/personalization/models/address_model.dart';
import 'package:shopping_app/utils/check_conncetion/network_manager.dart';
import 'package:shopping_app/utils/constants/image_strings.dart';
import 'package:shopping_app/utils/popups/full_screen_loader.dart';
import '../../../common/widgets/loaders/circular_loader.dart';
import '../../../data/repositories/address/address_repository.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final postalCode = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController();
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  RxBool refreshData = true.obs;
  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final addressRepository = Get.put(AddressRepository());

  /// Fetch all user specific addresses
  Future<List<AddressModel>> getAllUserAddress() async {
    try {
      final addresses = await addressRepository.fetchUserAddress();
      selectedAddress.value = addresses.firstWhere(
          (element) => element.selectAddress,
          orElse: () => AddressModel.empty());
      return addresses;
    } catch (e) {
      RLoaders.errorSnackBar(title: 'Address not found', message: e.toString());
      return [];
    }
  }

  Future selectAddress(AddressModel newSelectedAddress) async {
    try {
      Get.defaultDialog(
        title: '',
        onWillPop: () async {
          return false;
        },
        barrierDismissible: false,
        backgroundColor: Colors.transparent,
        content: RCircularLoader(),
      );

      // Clear the "selected" field
      if (selectedAddress.value.id.isNotEmpty) {
        await addressRepository.updateSelectedField(
            selectedAddress.value.id, false);
      }
      // Assign selected address
      newSelectedAddress.selectAddress = true;
      selectedAddress.value = newSelectedAddress;

      Get.back();
      // set the "selected" to true for the only selected address
      await addressRepository.updateSelectedField(
          selectedAddress.value.id, true);
    } catch (e) {
      RLoaders.errorSnackBar(
          title: 'Error in Selection', message: e.toString());
    }
  }

  /// Add New Address
  Future addNewAddresses() async {
    try {
      // Start Loading
      RFullScreenLoader.openLoadingDialog(
          'Storing Address...', RImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        RFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!addressFormKey.currentState!.validate()) {
        RFullScreenLoader.stopLoading();
        return;
      }

      // Save Address Data
      final address = AddressModel(
        id: '',
        name: name.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        street: street.text.trim(),
        state: state.text.trim(),
        city: city.text.trim(),
        postalCode: postalCode.text.trim(),
        country: country.text.trim(),
        selectAddress: true,
      );
      final id = await addressRepository.addAddress(address);

      // Update selected Address status
      address.id = id;
      await selectedAddress(address);

      // Show Success message
      RLoaders.successSnackBar(
          title: 'Congratulation',
          message: 'Your address has been saved successfully');

      // Remove Addresses Data
      refreshData.toggle();

      // Reset Field
      resetFormField();

      // Redirect
      Navigator.of(Get.context!).pop();
    } catch (e) {
      // Remove Loader
      RFullScreenLoader.stopLoading();
      RLoaders.errorSnackBar(title: 'Address Not Found', message: e.toString());
    }
  }

  /// Function to reset form field
  void resetFormField() {
    name.clear();
    phoneNumber.clear();
    street.clear();
    postalCode.clear();
    city.clear();
    state.clear();
    country.clear();
    addressFormKey.currentState?.reset();
  }
}
