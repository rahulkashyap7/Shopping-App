import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopping_app/common/widgets/images/R_rounded_image.dart';
import 'package:shopping_app/common/widgets/texts/product_price_text.dart';
import 'package:shopping_app/common/widgets/texts/product_title_text.dart';
import 'package:shopping_app/features/shop/screens/product_details/product_details.dart';
import 'package:shopping_app/utils/constants/colors.dart';
import 'package:shopping_app/utils/constants/image_strings.dart';
import 'package:shopping_app/utils/constants/sizes.dart';
import 'package:shopping_app/utils/helpers/helper_function.dart';
import '../../../styles/shadow.dart';
import '../../custom_shapes/container/rounded_container.dart';
import '../../icons/r_circular_icon.dart';
import '../../texts/brand_title_with_verfied_icon.dart';

class RProductCardVertical extends StatelessWidget {
  const RProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = RHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen()),
      child: Container(
        width: 180,
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [RShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(RSizes.productImageRadius),
          color: dark ? RColors.darkerGrey : RColors.white,
        ),
        child: Column(
          children: [
            // Thumbnail
            RRoundedContainer(
              height: 180,
              padding: EdgeInsets.all(RSizes.sm),
              backgroundColor: dark ? RColors.dark : RColors.light,
              child: Stack(
                children: [
                  // Thumbnail Image
                  RRoundedImage(
                      imageUrl: RImages.productImage1, applyImageRadius: true),

                  // Sale Tag
                  Positioned(
                    top: 12,
                    child: RRoundedContainer(
                      radius: RSizes.sm,
                      backgroundColor: RColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: RSizes.sm, vertical: RSizes.xs),
                      child: Text('25%',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .apply(color: RColors.black)),
                    ),
                  ),

                  // Favourite Icon
                  Positioned(
                      top: 0,
                      right: 0,
                      child: RCircularIcon(
                        icon: Iconsax.heart5,
                        color: Colors.red,
                      ))
                ],
              ),
            ),
            const SizedBox(height: RSizes.spaceBtwItems / 2),

            // Details
            Padding(
              padding: EdgeInsets.only(left: RSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RProductTitleText(
                      title: 'Nike Air Jordan Sneakers', smallSize: true),
                  const SizedBox(height: RSizes.spaceBtwItems / 2),
                  RBrandTitleWithVerifiedIcon(title: 'Nike'),
                ],
              ),
            ),

            // Spacer
            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Product Price
                Padding(
                  padding: const EdgeInsets.only(left: RSizes.sm),
                  child: const RProductPriceText(price: '35.0'),
                ),

                Container(
                  decoration: BoxDecoration(
                    color: RColors.dark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(RSizes.cardRadiusMd),
                      bottomRight:
                      Radius.circular(RSizes.productImageRadius),
                    ),
                  ),
                  child: SizedBox(
                      width: RSizes.iconLg * 1.2,
                      height: RSizes.iconLg * 1.2,
                      child: Center(
                          child:
                          Icon(Iconsax.add, color: RColors.white))),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

