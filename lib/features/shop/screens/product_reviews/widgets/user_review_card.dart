import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:shopping_app/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:shopping_app/common/widgets/products/ratings/rating_indicator.dart';
import 'package:shopping_app/utils/constants/colors.dart';
import 'package:shopping_app/utils/constants/image_strings.dart';
import 'package:shopping_app/utils/helpers/helper_function.dart';

import '../../../../../utils/constants/sizes.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = RHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(backgroundImage: AssetImage(RImages.userPic)),
                const SizedBox(width: RSizes.spaceBtwItems),
                Text('Rahul Kashyap', style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        const SizedBox(height: RSizes.spaceBtwItems),
        
        // Reviews
        Row(
          children: [
            RRatingBarIndicator(rating: 4),
            const SizedBox(width  : RSizes.spaceBtwItems),
            Text('27 Feb, 2025', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: RSizes.spaceBtwItems),
        ReadMoreText(
          'The user interface of the app is quite intuitive. I was able to navigate and make purchase seamlessly. Great Job!',
          trimLines: 1,
          trimMode: TrimMode.Line,
          trimExpandedText: ' show less',
          trimCollapsedText: ' show more',
          moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: RColors.primary),
          lessStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: RColors.primary),
        ),
        const SizedBox(height: RSizes.spaceBtwItems),

        // Company Review
        RRoundedContainer(
          backgroundColor: dark ? RColors.darkerGrey : RColors.grey,
          child: Padding(padding: EdgeInsets.all(RSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("R's Store", style: Theme.of(context).textTheme.titleMedium),
                    Text("28 Feb, 2025", style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                const SizedBox(height: RSizes.spaceBtwItems),
                const ReadMoreText(
                  'The user interface of the app is quite intuitive. I was able to navigate and make purchase seamlessly. Great Job!',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: ' show less',
                  trimCollapsedText: ' show more',
                  moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: RColors.primary),
                  lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: RColors.primary),
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: RSizes.spaceBtwSections)
      ],
    );
  }
}
