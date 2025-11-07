import 'package:get/get.dart';
import 'package:shopping_app/common/widgets/loaders/loaders.dart';
import 'package:shopping_app/features/personalization/models/address_model.dart';
import '../../../data/repositories/address/address_repository.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  final addressRepository = Get.put(AddressRepository());

  /// Fetch all user specific addresses
  Future<List<AddressModel>> allUserAddress() async {
    try {
      final addresses = await addressRepository.fetchUserAddress();
      return addresses;
    } catch (e) {
      RLoaders.errorSnackBar(title: 'Address not found', message: e.toString());
      return [];
    }
  }
}