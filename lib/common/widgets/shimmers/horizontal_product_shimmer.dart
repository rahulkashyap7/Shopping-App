import 'package:flutter/material.dart';
import 'package:shopping_app/utils/constants/sizes.dart';
import 'package:shopping_app/utils/popups/shimmer.dart';

class RHorizontalProductShimmer extends StatelessWidget {
  const RHorizontalProductShimmer({
    super.key,
    this.itemCount = 4,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: RSizes.spaceBtwSections),
      height: 120,
      child: ListView.separated(
        itemCount: itemCount,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) =>
            SizedBox(width: RSizes.spaceBtwItems),
        itemBuilder: (_, __) => Container(
          width: 310,
          padding: EdgeInsets.all(1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(RSizes.productImageRadius),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Image Shimmer
              RShimmerEffect(
                width: 120,
                height: 120,
                radius: RSizes.productImageRadius,
              ),
              SizedBox(width: RSizes.spaceBtwItems),

              /// Details Section
              SizedBox(
                width: 172,
                child: Padding(
                  padding: EdgeInsets.only(top: RSizes.sm, left: RSizes.sm),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Product Title Shimmer
                      RShimmerEffect(width: 150, height: 16),
                      SizedBox(height: RSizes.spaceBtwItems / 2),

                      /// Brand Name Shimmer
                      RShimmerEffect(width: 100, height: 14),

                      Spacer(),

                      /// Price Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          /// Price Shimmer
                          RShimmerEffect(width: 60, height: 16),

                          /// Add Button Shimmer
                          RShimmerEffect(
                            width: RSizes.iconLg * 1.2,
                            height: RSizes.iconLg * 1.2,
                            radius: RSizes.cardRadiusMd,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
