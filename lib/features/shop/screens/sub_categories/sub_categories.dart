import 'package:flutter/material.dart';
import 'package:shopping_app/common/widgets/appbar/appbar.dart';
import 'package:shopping_app/common/widgets/images/R_rounded_image.dart';
import 'package:shopping_app/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:shopping_app/common/widgets/texts/section_heading.dart';
import 'package:shopping_app/utils/constants/image_strings.dart';
import 'package:shopping_app/utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RAppBar(title: Text('Sports Shirts'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(RSizes.defaultSpace),
        child: Column(
          children: [
            // Banner
            RRoundedImage(width: double.infinity, imageUrl: RImages.promoBanner1, applyImageRadius: true),
            const SizedBox(height: RSizes.spaceBtwSections),
            
            // Sub-Categories
            Column(
              children: [
                // Heading
                RSectionHeading(title: 'Sports shirts', onPressed: () {}),
                const SizedBox(height: RSizes.spaceBtwItems / 2),

                SizedBox(
                  height: 120,
                  child: ListView.separated(
                    itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => const SizedBox(width: RSizes.spaceBtwItems),
                      itemBuilder: (context, index) => const RProductCardHorizontal()
                  ),
                ),
              ],
            )
          ],
        ),
        ),
      ),
    );
  }
}
