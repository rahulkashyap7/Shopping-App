import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shopping_app/data/repositories/authentication/authentication_repository.dart';
import '../../../features/personalization/models/address_model.dart';

class AddressRepository extends GetxController {
  static AddressRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<AddressModel>> fetchUserAddress() async {
    try {
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if (userId.isEmpty) throw 'Unable to find user information. Try again in few minutes.';

      final result = await _db.collection('User').doc(userId).collection('Addresses').get();
      return result.docs.map((documentSnapshot) => AddressModel.fromDocumentSnapshot(documentSnapshot)).toList();
    } catch (e) {
      throw 'Something went wrong while fetching Address information. Try again later.';
    }
  }
}