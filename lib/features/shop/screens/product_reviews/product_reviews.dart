import 'package:flutter/material.dart';
import 'package:shopping_app/common/widgets/appbar/appbar.dart';
import 'package:shopping_app/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:shopping_app/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:shopping_app/utils/constants/sizes.dart';
import '../../../../common/widgets/products/ratings/rating_indicator.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar
      appBar: RAppBar(title: Text('Reviews & Ratings'), showBackArrow: true),

      // Body
      body: SingleChildScrollView(
        padding: EdgeInsets.all(RSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Ratings and reviews are verified and are the people who use the same type of device that you use."),
            SizedBox(height: RSizes.spaceBtwItems),

            // Overall product rating
            ROverallProductRating(),
            RRatingBarIndicator(rating: 4.5),
            Text("12,611", style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: RSizes.spaceBtwSections),

            // User reviews List
            const UserReviewCard(),
            const UserReviewCard(),
            const UserReviewCard(),
            const UserReviewCard(),
          ],
        ),
      ),
    );
  }
}



