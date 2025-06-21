import 'package:flutter/material.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_function.dart';
import '../../images/R_rounded_image.dart';
import '../../texts/brand_title_with_verfied_icon.dart';
import '../../texts/product_title_text.dart';


class RCartItem extends StatelessWidget {
  const RCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Image
        RRoundedImage(
          imageUrl: RImages.productImage2,
          width: 60,
          height: 60,
          padding: EdgeInsets.all(RSizes.sm),
          backgroundColor: RHelperFunctions.isDarkMode(context) ? RColors.darkerGrey : RColors.light,
        ),
        const SizedBox(width: RSizes.spaceBtwItems),

        // Title, Price & Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RBrandTitleWithVerifiedIcon(title: 'Nike'),
              Flexible(child: RProductTitleText(title: 'Green Sport Shoes', maxLines: 1)),
              // Attributes
              Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: 'Color ', style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(text: 'Green ', style: Theme.of(context).textTheme.bodyLarge),
                      TextSpan(text: 'Size ', style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(text: 'UK 07 ', style: Theme.of(context).textTheme.bodyLarge),
                    ],
                  )
              )
            ],
          ),
        )
      ],
    );
  }
}