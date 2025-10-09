import 'package:flutter/material.dart';
import 'package:shopping_app/common/widgets/images/r_circular_image.dart';
import 'package:shopping_app/common/widgets/texts/brand_title_with_verfied_icon.dart';
import 'package:shopping_app/common/widgets/texts/product_price_text.dart';
import 'package:shopping_app/common/widgets/texts/product_title_text.dart';
import 'package:shopping_app/features/shop/controls/product/product_controller.dart';
import 'package:shopping_app/features/shop/models/product_model.dart';
import 'package:shopping_app/utils/constants/enums.dart';
import 'package:shopping_app/utils/constants/image_strings.dart';

import '../../../../../common/widgets/custom_shapes/container/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_function.dart';

class RProductMetaData extends StatelessWidget {
  const RProductMetaData({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    final darkMode = RHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price & Sale Price
        Row(
          children: [
            // Sale Tag
            RRoundedContainer(
              radius: RSizes.sm,
              backgroundColor: RColors.secondary.withOpacity(0.8),
              padding: EdgeInsets.symmetric(horizontal: RSizes.sm, vertical: RSizes.xs),
              child: Text('$salePercentage%', style: Theme.of(context).textTheme.labelLarge!.apply(color: RColors.black)),
            ),
            const SizedBox(width: RSizes.spaceBtwItems),

            // Price
            if(product.productType == ProductType.single.toString() &&product.salePrice > 0)
            Text('\$${product.price}', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
            if(product.productType == ProductType.single.toString() &&product.salePrice > 0) const SizedBox(width: RSizes.spaceBtwItems),
            RProductPriceText(price: controller.getProductPrice(product), isLarge: true),
          ]
        ),
        const SizedBox(height: RSizes.spaceBtwItems / 1.5),

        /// title
        RProductTitleText(title: product.title),
        const SizedBox(height: RSizes.spaceBtwItems / 1.5),

        /// Stack Status
        Row(
          children: [
            RProductTitleText(title: 'Status'),
            const SizedBox(width: RSizes.spaceBtwItems),
            Text(controller.getProductStockStatus(product.stock), style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: RSizes.spaceBtwItems / 1.5),

        /// Brand
        Row(
          children: [
            RCircularImage(image: product.brand != null ? product.brand!.image : '',
                width: 32,
                height: 32,
                overlayColor: darkMode ? RColors.white : RColors.black),
            const SizedBox(width: RSizes.spaceBtwItems),
            RBrandTitleWithVerifiedIcon(title: product.brand != null ? product.brand!.name : '', brandTextSize: TextSizes.medium),
          ],
        ),

      ],
    );
  }
}
