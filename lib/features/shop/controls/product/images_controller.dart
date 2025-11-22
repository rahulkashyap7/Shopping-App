import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/sizes.dart';
import '../../models/product_model.dart';

class ImagesController extends GetxController {
  static ImagesController get instance => Get.find();

  /// Variables
  RxString selectedProductImage = ''.obs;

  /// -- Get All Images from product and variations
  List<String> getAllProductImages(ProductModel product) {
    // Use set to add unique images only
    Set<String> images = {};

    // load thumbnail image (only if not empty)
    if (product.thumbnail.isNotEmpty) {
      images.add(product.thumbnail);
      // Assign thumbnail as Selected image
      selectedProductImage.value = product.thumbnail;
    }

    // Get all images from the product Model if not null
    if (product.images != null) {
      images.addAll(product.images!.where((img) => img.isNotEmpty));
    }

    // Get all images from the product variations if not null
    if (product.productVariations != null &&
        product.productVariations!.isNotEmpty) {
      images.addAll(product.productVariations!
          .map((variation) => variation.image)
          .where((img) => img.isNotEmpty));
    }

    return images.toList();
  }

  /// -- Show Image Popup
  void showEnlargedImage(String image) {
    if (image.isEmpty) {
      return;
    }
    Get.to(
      fullscreenDialog: true,
      () => Dialog.fullscreen(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: RSizes.defaultSpace * 2,
                  horizontal: RSizes.defaultSpace),
              child: CachedNetworkImage(imageUrl: image),
            ),
            const SizedBox(height: RSizes.spaceBtwSections),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 150,
                child: OutlinedButton(
                    onPressed: () => Get.back(), child: const Text('Close')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
