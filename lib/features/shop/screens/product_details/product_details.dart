import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:shopping_app/common/widgets/texts/section_heading.dart';
import 'package:shopping_app/features/shop/screens/product_details/widgets/bottom_product_add_to_cart.dart';
import 'package:shopping_app/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:shopping_app/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:shopping_app/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:shopping_app/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:shopping_app/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:shopping_app/utils/constants/sizes.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: RBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // product Image Slider
            RProductImageSlider(),

            // Product Details
            Padding(
                padding: EdgeInsets.only(right: RSizes.defaultSpace, left: RSizes.defaultSpace, bottom: RSizes.defaultSpace),
              child: Column(
                children: [
                  /// Ratings
                  RRatingAndShare(),

                  /// Price, Title & Brand
                  RProductMetaData(),

                  /// Attributes
                  RProductAttributes(),
                  SizedBox(height: RSizes.spaceBtwSections),
                  
                  /// CheckOut Button
                  SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child: Text('Checkout'))),
                  SizedBox(height: RSizes.spaceBtwSections),

                  /// Description
                  RSectionHeading(title: 'Description', showActionButton: false),
                  ReadMoreText(
                    'This is a product description for low-top sneaker with a green and white color scheme. The shoe has a white leather base with green overlays, a green Nike Swoosh, green laces, and a matching green outsole.',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Less',
                    moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  /// Reviews
                  const Divider(),
                  SizedBox(height: RSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RSectionHeading(title: 'Reviews(199)', showActionButton: false),
                      IconButton(icon: Icon(Iconsax.arrow_right_3, size: 18), onPressed: () => Get.to(() => ProductReviewsScreen())),
                    ],
                  ),
                  SizedBox(height: RSizes.spaceBtwSections),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


