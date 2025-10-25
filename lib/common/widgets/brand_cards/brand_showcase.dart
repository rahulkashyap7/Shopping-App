import 'package:flutter/material.dart';
import 'package:shopping_app/common/widgets/brand_cards/r_brand_card.dart';
import 'package:shopping_app/features/shop/models/brand_model.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_function.dart';
import '../custom_shapes/container/rounded_container.dart';

class RBrandShowCase extends StatelessWidget {
  const RBrandShowCase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return RRoundedContainer(
      showBorder: true,
      borderColor: RColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: EdgeInsets.all(RSizes.md),
      margin: EdgeInsets.only(bottom: RSizes.spaceBtwItems),
      child: Column(
        children: [
          // Brand with Product Count
          RBrandCard(showBorder: false, brand: BrandModel.empty(),),
          const SizedBox(height: RSizes.spaceBtwItems),

          // Brand Top 3 Product Images
          Row(
              children: images
                  .map((image) => brandTopProductImageWidget(image, context))
                  .toList()),
        ],
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    return Expanded(
      child: RRoundedContainer(
        height: 100,
        padding: EdgeInsets.all(RSizes.md),
        margin: EdgeInsets.only(right: RSizes.sm),
        backgroundColor: RHelperFunctions.isDarkMode(context)
            ? RColors.darkerGrey
            : RColors.light,
        child: Image(fit: BoxFit.contain, image: AssetImage(image)),
      ),
    );
  }
}
