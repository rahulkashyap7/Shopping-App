import 'package:get/get.dart';
import 'package:shopping_app/utils/check_conncetion/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}