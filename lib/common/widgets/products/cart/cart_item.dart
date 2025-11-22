import 'package:flutter/material.dart';
import 'package:shopping_app/features/shop/models/cart_item_model.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_function.dart';
import '../../images/R_rounded_image.dart';
import '../../texts/brand_title_with_verfied_icon.dart';
import '../../texts/product_title_text.dart';


class RCartItem extends StatelessWidget {
  const RCartItem({
    super.key, required this.cartItem,
  });

  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Image
        RRoundedImage(
          imageUrl: cartItem.image ?? '',
          width: 60,
          height: 60,
          isNetworkImage: true,
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
              RBrandTitleWithVerifiedIcon(title: cartItem.brandName ?? ''),
              Flexible(
                  child: RProductTitleText(title: cartItem.title, maxLines: 1)),
              // Attributes
              Text.rich(
                TextSpan(
                  children: (cartItem.selectedVariation ?? {}).entries.map(
                        (e) => TextSpan(
                          children: [
                            TextSpan(
                                text: ' ${e.key} ',
                                style: Theme.of(context).textTheme.bodySmall),
                            TextSpan(
                                text: ' ${e.value} ',
                                style: Theme.of(context).textTheme.bodyLarge),
                          ],
                        ),
                      ).toList(),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}