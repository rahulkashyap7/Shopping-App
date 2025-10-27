import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shopping_app/features/shop/models/brand_model.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();

  /// Variable
  final _db = FirebaseFirestore.instance;

  /// Get all categories
  Future<List<BrandModel>> getAllBrands() async {
    try {
      final snapshot = await _db.collection('Brands').get();

      print('DEBUG: Found ${snapshot.docs.length} brands');

      // Debug: Print first document's data structure
      if (snapshot.docs.isNotEmpty) {
        print('DEBUG: First brand data: ${snapshot.docs.first.data()}');
      }

      final result =
          snapshot.docs.map((e) => BrandModel.fromSnapshot(e)).toList();

      print('DEBUG: Successfully parsed ${result.length} brands');

      return result;
    } on FirebaseException catch (e) {
      print(
          'DEBUG: FirebaseException in getAllBrands: ${e.code} - ${e.message}');
      throw RFirebaseException(e.code).message;
    } on FormatException catch (_) {
      print('DEBUG: FormatException in getAllBrands');
      throw const RFormatException();
    } on PlatformException catch (e) {
      print(
          'DEBUG: PlatformException in getAllBrands: ${e.code} - ${e.message}');
      throw RPlatformException(e.code).message;
    } catch (e) {
      print('DEBUG: General Exception in getAllBrands: $e');
      throw 'Something went wrong. While fetching brands: $e';
    }
  }

  /// Get Brands for category
}
