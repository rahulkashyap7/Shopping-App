import 'package:flutter/material.dart';
import 'package:shopping_app/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:shopping_app/common/widgets/texts/product_price_text.dart';
import 'package:shopping_app/common/widgets/texts/product_title_text.dart';
import 'package:shopping_app/common/widgets/texts/section_heading.dart';
import 'package:shopping_app/utils/constants/sizes.dart';
import 'package:shopping_app/utils/helpers/helper_function.dart';

import '../../../../../common/widgets/chips/choice_chips.dart';
import '../../../../../utils/constants/colors.dart';

class RProductAttributes extends StatelessWidget {
  const RProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = RHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        // Selected Attribute Pricing & Description
        RRoundedContainer(
          padding: EdgeInsets.all(RSizes.md),
          backgroundColor: dark ? RColors.darkerGrey : RColors.grey,
          child: Column(
            children: [
              // Title, Price and Stock Status
              Row(
                children: [
                  RSectionHeading(title: 'Variation', showActionButton: false),
                  SizedBox(width: RSizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const RProductTitleText(
                              title: 'Price', smallSize: true),
                          const SizedBox(width: RSizes.spaceBtwItems),

                          // Actual Price
                          Text('\$25',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleSmall!
                                  .apply(
                                  decoration: TextDecoration.lineThrough)),
                          const SizedBox(width: RSizes.spaceBtwItems),

                          // Sale Price
                          const RProductPriceText(price: '20'),
                        ],
                      ),

                      // Stock
                      Row(
                        children: [
                          const RProductTitleText(
                              title: 'Stock', smallSize: true),
                          const SizedBox(width: RSizes.spaceBtwItems),
                          Text('In Stock',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleMedium),
                        ],
                      )
                    ],
                  ),
                ],
              ),

              // Variation Description
              RProductTitleText(
                title:
                'This is the Description of the product and it can go upto max 4 lines.',
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),
        const SizedBox(height: RSizes.spaceBtwItems),

        // Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RSectionHeading(title: 'Colors', showActionButton: false),
            SizedBox(height: RSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                RChoiceChip(text: 'Green', selected: true, onSelected: (value){}),
                RChoiceChip(text: 'Blue', selected: false, onSelected: (value){}),
                RChoiceChip(text: 'Yellow', selected: false, onSelected: (value){}),
              ],
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RSectionHeading(title: 'Size', showActionButton: false),
            SizedBox(height: RSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                RChoiceChip(text: 'EU 34', selected: true, onSelected: (value){}),
                RChoiceChip(text: 'EU 36', selected: false, onSelected: (value){}),
                RChoiceChip(text: 'EU 38', selected: false, onSelected: (value){}),
              ],
            )
          ],
        )
      ],
    );
  }
}

