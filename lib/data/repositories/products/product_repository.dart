import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../bindings/firebase_storage_service.dart';
import '../../../features/shop/models/product_model.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  /// Firebase instance for database interactions.
  final _db = FirebaseFirestore.instance;

  /// Get Limited Products
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .limit(4)
          .get();

      print(
          'DEBUG: Found ${snapshot.docs.length} products with IsFeatured=true');

      // Debug: Print first document's data structure
      if (snapshot.docs.isNotEmpty) {
        print('DEBUG: First product data: ${snapshot.docs.first.data()}');
      }

      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      print('DEBUG: FirebaseException: ${e.code} - ${e.message}');
      throw RFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      print('DEBUG: PlatformException: ${e.code} - ${e.message}');
      throw RPlatformException(e.code).message;
    } catch (e) {
      print('DEBUG: General Exception: $e');
      throw 'Something went wrong. Please try again: $e';
    }
  }

  /// Get Limited Products
  Future<List<ProductModel>> getAllFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw RFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw RPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Get Limited Products
  Future<List<ProductModel>> fetchProductsByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();
      final List<ProductModel> productList = querySnapshot.docs
          .map((doc) => ProductModel.fromQuerySnapshot(doc))
          .toList();
      return productList;
    } on FirebaseException catch (e) {
      throw RFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw RPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<List<ProductModel>> getProductsForBrands(
      {required String brandId, int limit = -1}) async {
    try {
      // Try to parse brandId as int, if it fails, use as string
      // In Firestore, Brand.Id is stored as integer (1, 2, 3)
      dynamic brandIdQuery = brandId;
      try {
        brandIdQuery = int.parse(brandId);
        print('DEBUG: Querying products with Brand.Id (int) = $brandIdQuery');
      } catch (e) {
        print(
            'DEBUG: Querying products with Brand.Id (string) = $brandIdQuery');
      }

      final querySnapshot = limit == -1
          ? await _db
              .collection('Products')
              .where('Brand.Id', isEqualTo: brandIdQuery)
              .get()
          : await _db
              .collection('Products')
              .where('Brand.Id', isEqualTo: brandIdQuery)
              .limit(limit)
              .get();

      print(
          'DEBUG: Found ${querySnapshot.docs.length} products for brand $brandId');

      if (querySnapshot.docs.isNotEmpty) {
        print(
            'DEBUG: First product brand data: ${querySnapshot.docs.first.data()['Brand']}');
      }

      final products = querySnapshot.docs
          .map((doc) => ProductModel.fromSnapshot(doc))
          .toList();

      return products;
    } on FirebaseException catch (e) {
      print(
          'DEBUG: FirebaseException in getProductsForBrands: ${e.code} - ${e.message}');
      throw RFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      print(
          'DEBUG: PlatformException in getProductsForBrands: ${e.code} - ${e.message}');
      throw RPlatformException(e.code).message;
    } catch (e) {
      print('DEBUG: General Exception in getProductsForBrands: $e');
      throw 'Something went wrong. Please try again: $e';
    }
  }

  /// Upload dummy data to the Cloud Firebase
  Future<void> uploadDummyData(List<ProductModel> products) async {
    try {
      // Upload all the products along with their images
      final storage = Get.put(RFirebaseStorageService());

      // Loop through each product
      for (var product in products) {
        // Get image data link from local assets
        final thumbnail = await storage.getImageFromAssets(product.thumbnail);

        // Upload image and get its URL
        final url = await storage.uploadingImageData(
            'Products/Images', thumbnail, product.thumbnail.toString());

        // Assign URL to product.thumbnail attribute
        product.thumbnail = url;

        // Product list of images
        if (product.images != null && product.images!.isNotEmpty) {
          List<String> imagesUrl = [];
          for (var image in product.images!) {
            // Get image data link from local assets
            final assetImage = await storage.getImageFromAssets(image);

            // Upload image and get its URL
            final url = await storage.uploadingImageData(
                'Products/Images', assetImage, image);

            // Assign URL to product.thumbnail attribute
            imagesUrl.add(url);
          }
          product.images!.clear();
          product.images!.addAll(imagesUrl);
        }

        // Upload Variation Images
        if (product.productType == ProductType.variable.toString()) {
          for (var variation in product.productVariations!) {
            // Get image data link from local assets
            final assetImage =
                await storage.getImageFromAssets(variation.image);

            // Upload image and get its URL
            final url = await storage.uploadingImageData(
                'Products/Images', assetImage, variation.image);

            // Assign URL to variation.image attribute
            variation.image = url;
          }
        }

        // Store product in Firestore
        await _db.collection("Products").doc(product.id).set(product.toJson());
      }
    } on FirebaseException catch (e) {
      throw e.message!;
    } on SocketException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.message!;
    } catch (e) {
      throw e.toString();
    }
  }
}
