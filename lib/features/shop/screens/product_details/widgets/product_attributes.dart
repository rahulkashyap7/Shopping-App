import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shopping_app/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:shopping_app/common/widgets/texts/product_price_text.dart';
import 'package:shopping_app/common/widgets/texts/product_title_text.dart';
import 'package:shopping_app/common/widgets/texts/section_heading.dart';
import 'package:shopping_app/features/shop/controls/product/variation_controller.dart';
import 'package:shopping_app/features/shop/models/product_model.dart';
import 'package:shopping_app/utils/constants/sizes.dart';
import 'package:shopping_app/utils/helpers/helper_function.dart';

import '../../../../../common/widgets/chips/choice_chips.dart';
import '../../../../../utils/constants/colors.dart';

class RProductAttributes extends StatelessWidget {
  const RProductAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariationController());
    final dark = RHelperFunctions.isDarkMode(context);

    return Obx(
      () => Column(
        children: [
          /// Selected Attribute Pricing & Description
          // Display variation price and stock when some variation is selected
          if (controller.selectedVariation.value.id.isNotEmpty)
            RRoundedContainer(
              padding: EdgeInsets.all(RSizes.md),
              backgroundColor: dark ? RColors.darkerGrey : RColors.grey,
              child: Column(
                children: [
                  // Title, Price and Stock Status
                  Row(
                    children: [
                      RSectionHeading(
                          title: 'Variation', showActionButton: false),
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
                              if (controller.selectedVariation.value.salePrice >
                                  0)
                                Text(
                                    '\$${controller.selectedVariation.value.price}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .apply(
                                            decoration:
                                                TextDecoration.lineThrough)),
                              const SizedBox(width: RSizes.spaceBtwItems),

                              // Sale Price
                              RProductPriceText(
                                  price: controller.getVariationPrice()),
                            ],
                          ),

                          // Stock
                          Row(
                            children: [
                              const RProductTitleText(
                                  title: 'Stock', smallSize: true),
                              const SizedBox(width: RSizes.spaceBtwItems),
                              Text(controller.variationStockStatus.value,
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),

                  // Variation Description
                  RProductTitleText(
                    title: controller.selectedVariation.value.description ?? '',
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
            children: product.productAttributes!
                .map((attribute) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RSectionHeading(
                            title: attribute.name ?? '',
                            showActionButton: false),
                        SizedBox(height: RSizes.spaceBtwItems / 2),
                        Wrap(
                            spacing: 8,
                            children: attribute.values!.map((attributeValue) {
                              final isSelected = controller
                                      .selectedAttributes[attribute.name] ==
                                  attributeValue;
                              final available = controller
                                  .getAttributeAvailabilityInVariation(
                                      product.productVariations!,
                                      attribute.name!)
                                  .contains(attributeValue);

                              return RChoiceChip(
                                  text: attributeValue,
                                  selected: isSelected,
                                  onSelected: available
                                      ? (selected) {
                                          if (selected && available) {
                                            controller.onAttributeSelected(
                                                product,
                                                attribute.name ?? '',
                                                attributeValue);
                                          }
                                        }
                                      : null);
                            }).toList())
                      ],
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
