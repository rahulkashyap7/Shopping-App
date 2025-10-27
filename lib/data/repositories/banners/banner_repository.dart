import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shopping_app/utils/exceptions/format_exceptions.dart';
import 'package:shopping_app/utils/exceptions/platform_exceptions.dart';
import '../../../features/shop/models/banner_model.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get all order related to current user
  Future<List<BannerModel>> fetchBanners() async {
    try {
      final result = await _db
          .collection('Banners')
          .where('Active', isEqualTo: true)
          .get();

      print('DEBUG: Found ${result.docs.length} active banners');

      // Debug: Print first document's data structure
      if (result.docs.isNotEmpty) {
        print('DEBUG: First banner data: ${result.docs.first.data()}');
      }

      return result.docs
          .map((documentSnapshot) => BannerModel.fromSnapshot(documentSnapshot))
          .toList();
    } on FirebaseException catch (e) {
      print(
          'DEBUG: FirebaseException in fetchBanners: ${e.code} - ${e.message}');
      throw RFirebaseException(e.code).message;
    } on FormatException catch (_) {
      print('DEBUG: FormatException in fetchBanners');
      throw const RFormatException();
    } on PlatformException catch (e) {
      print(
          'DEBUG: PlatformException in fetchBanners: ${e.code} - ${e.message}');
      throw RPlatformException(e.code).message;
    } catch (e) {
      print('DEBUG: General Exception in fetchBanners: $e');
      throw 'Something went wrong. While fetching banners: $e';
    }
  }

  /// Upload Banner to the cloud Firebase}
}
