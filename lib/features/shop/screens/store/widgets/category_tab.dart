import 'package:flutter/material.dart';
import 'package:shopping_app/common/widgets/layouts/grid_layout.dart';
import 'package:shopping_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:shopping_app/common/widgets/texts/section_heading.dart';
import 'package:shopping_app/features/shop/models/category_model.dart';
import 'package:shopping_app/features/shop/models/product_model.dart';
import '../../../../../common/widgets/brand_cards/brand_showcase.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class RCategoryTab extends StatelessWidget {
  const RCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [Padding(
        padding: EdgeInsets.all(RSizes.defaultSpace),
        child: Column(
          children: [
            // Brands
            RBrandShowCase(images: [
              RImages.productImage1,
              RImages.productImage2,
              RImages.productImage3
            ]),
            const SizedBox(height: RSizes.spaceBtwItems),


            // Products
            RSectionHeading(title: 'You might like', onPressed: () {}),
            const SizedBox(height: RSizes.spaceBtwItems),

            RGridLayout(itemCount: 4, itemBuilder: (_, index) => RProductCardVertical(product: ProductModel.empty())),
            const SizedBox(height: RSizes.spaceBtwSections),
          ],
        ),
      ),
      ]
    );
  }
}
