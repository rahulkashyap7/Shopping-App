import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopping_app/features/shop/controls/product/images_controller.dart';
import 'package:shopping_app/features/shop/models/product_model.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widget/curved_edges_widgets.dart';
import '../../../../../common/widgets/icons/r_circular_icon.dart';
import '../../../../../common/widgets/images/R_rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_function.dart';

class RProductImageSlider extends StatelessWidget {
  const RProductImageSlider({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = RHelperFunctions.isDarkMode(context);

    final controller = Get.put(ImagesController());
    final images = controller.getAllProductImages(product);

    return RCurvedEdgeWidget(
      child: Container(
        color: dark ? RColors.darkerGrey : RColors.light,
        child: Stack(
          children: [
            SizedBox(
                // Main large image
                height: 400,
                child: Padding(
                  padding: EdgeInsets.all(RSizes.productImageRadius * 2),
                  child: Center(child: Obx(() {
                    final image = controller.selectedProductImage.value;
                    return GestureDetector(
                      onTap: () => controller.showEnlargedImage(image),
                      child: CachedNetworkImage(
                          imageUrl: image,
                          progressIndicatorBuilder: (_, __, downloadProgress) =>
                              CircularProgressIndicator(
                                  value: downloadProgress.progress,
                                  color: RColors.primary)),
                    );
                  })),
                )),

            // Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: RSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: images.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) =>
                      const SizedBox(width: RSizes.spaceBtwItems),
                  itemBuilder: (_, index) => Obx(() {
                    final imageSelected = controller.selectedProductImage.value == images[index];
                    return RRoundedImage(
                      width: 80,
                      isNetworkImage: true,
                      imageUrl: images[index],
                      padding: EdgeInsets.all(RSizes.sm),
                      backgroundColor: dark ? RColors.dark : RColors.white,
                      onPressed: () => controller.selectedProductImage.value = images[index],
                      border: Border.all(color: imageSelected ? RColors.primary : Colors.transparent),
                    );
                  }),
                ),
              ),
            ),

            // Appbar Icons
            RAppBar(
              showBackArrow: true,
              actions: [
                RCircularIcon(icon: Iconsax.heart5, color: Colors.red),
              ],
            )
          ],
        ),
      ),
    );
  }
}
