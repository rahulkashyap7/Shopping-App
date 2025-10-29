import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shopping_app/common/widgets/brand_cards/r_brand_card.dart';
import 'package:shopping_app/features/shop/models/brand_model.dart';
import 'package:shopping_app/features/shop/screens/brands/brand_products.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_function.dart';
import '../../../utils/popups/shimmer.dart';
import '../custom_shapes/container/rounded_container.dart';

class RBrandShowCase extends StatelessWidget {
  const RBrandShowCase({
    super.key,
    required this.images,
    required this.brand,
  });

  final BrandModel brand;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => BrandProducts(brand: brand)),
      child: RRoundedContainer(
        showBorder: true,
        borderColor: RColors.darkGrey,
        backgroundColor: Colors.transparent,
        padding: EdgeInsets.all(RSizes.md),
        margin: EdgeInsets.only(bottom: RSizes.spaceBtwItems),
        child: Column(
          children: [
            // Brand with Product Count
            RBrandCard(
              showBorder: false, brand: brand,
            ),
            const SizedBox(height: RSizes.spaceBtwItems),

            // Brand Top 3 Product Images
            Row(children: images.map((image) =>
                brandTopProductImageWidget(image, context)).toList()),
          ],
        ),
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    return Expanded(
      child: RRoundedContainer(
        height: 100,
        padding: const EdgeInsets.all(RSizes.md),
        margin: const EdgeInsets.only(right: RSizes.sm),
        backgroundColor: RHelperFunctions.isDarkMode(context) ? RColors
            .darkerGrey : RColors.light,
        child: CachedNetworkImage(
          fit: BoxFit.contain,
          imageUrl: image,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
          const RShimmerEffect(width: 100, height: 100),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ), // CachedNetworkImage
      ), // TRoundedContainer
    ); // Expanded
  }
}

