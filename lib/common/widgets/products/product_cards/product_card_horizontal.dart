import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopping_app/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:shopping_app/common/widgets/images/R_rounded_image.dart';
import 'package:shopping_app/common/widgets/products/favourite_icon/favourite_icon.dart';
import 'package:shopping_app/common/widgets/texts/brand_title_with_verfied_icon.dart';
import 'package:shopping_app/common/widgets/texts/product_price_text.dart';
import 'package:shopping_app/common/widgets/texts/product_title_text.dart';
import 'package:shopping_app/utils/constants/image_strings.dart';
import '../../../../features/shop/models/product_model.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_function.dart';
import '../../icons/r_circular_icon.dart';

class RProductCardHorizontal extends StatelessWidget {
  const RProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = RHelperFunctions.isDarkMode(context);

    return Container(
      width: 310,
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(RSizes.productImageRadius),
        color: dark ? RColors.darkerGrey : RColors.softGrey,
      ),
      child: Row(
        children: [
          // Thumbnail
          RRoundedContainer(
            height: 120,
            padding: EdgeInsets.all(RSizes.sm),
            backgroundColor: dark ? RColors.dark : RColors.light,
            child: Stack(
              children: [
                // Thumbnail Image
                SizedBox(
                    height: 120,
                    width: 120,
                    child: RRoundedImage(
                        imageUrl: RImages.productImage3,
                        applyImageRadius: true),
                ),

                // Sale Tag
                Positioned(
                  top: 12,
                  child: RRoundedContainer(
                    radius: RSizes.sm,
                    backgroundColor: RColors.secondary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(horizontal: RSizes.sm, vertical: RSizes.xs),
                    child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: RColors.black)),
                  ),
                ),

                // Favourite Icon
                Positioned(
                    top: 0,
                    right: 0,
                    child: RFavouriteIcon(productId: ''))
              ],
            ),
          ),

          // Details
          SizedBox(
            width: 172,
            child: Padding(
              padding: EdgeInsets.only(top: RSizes.sm, left: RSizes.sm),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RProductTitleText(title: 'Green Nike Low Top Sneaker', smallSize: true),
                      SizedBox(height: RSizes.spaceBtwItems / 2),
                      RBrandTitleWithVerifiedIcon(title: 'Nike'),
                    ],
                   ),

                   Spacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Pricing
                      Flexible(child: RProductPriceText(price: '256.0')),

                      // Add to cart
                      Container(
                        decoration: BoxDecoration(
                          color: RColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(RSizes.cardRadiusMd),
                            bottomRight: Radius.circular(RSizes.productImageRadius),
                          ),
                        ),
                        child: SizedBox(
                          width: RSizes.iconLg * 1.2,
                          height: RSizes.iconLg * 1.2,
                          child: Center(child: Icon(Iconsax.add, color: RColors.white)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
