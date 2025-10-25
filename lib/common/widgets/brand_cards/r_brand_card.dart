import 'package:flutter/material.dart';
import '../../../features/shop/models/brand_model.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_function.dart';
import '../custom_shapes/container/rounded_container.dart';
import '../images/r_circular_image.dart';
import '../texts/brand_title_with_verfied_icon.dart';


class RBrandCard extends StatelessWidget {
  const RBrandCard({
    super.key, required this.showBorder, this.onTap, required this.brand,
  });

  final BrandModel brand;
  final bool showBorder;
  final void Function()? onTap;
  


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: RRoundedContainer(
        padding: EdgeInsets.all(RSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            // ICons
            Flexible(
              child: RCircularImage(
                isNetworkImage: true,
                image: brand.image,
                backgroundColor: Colors.transparent,
                overlayColor:
                RHelperFunctions.isDarkMode(context) ? RColors.white : RColors.black,
              ),
            ),
            const SizedBox(
                width: RSizes.spaceBtwItems / 2),

            // Text
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RBrandTitleWithVerifiedIcon(
                      title: brand.name,
                      brandTextSize: TextSizes.large),
                  Text(
                    '${brand.productsCount ?? 0} products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}