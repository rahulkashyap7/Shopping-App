import 'package:flutter/cupertino.dart';
import 'package:shopping_app/utils/popups/shimmer.dart';
import '../../../utils/constants/sizes.dart';

class RCategoryShimmer extends StatelessWidget {
  const RCategoryShimmer({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => const SizedBox(width: RSizes.spaceBtwItems),
        itemBuilder: (_, __) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image
              RShimmerEffect(width: 55, height: 55, radius: 55),
              SizedBox(height: RSizes.spaceBtwItems / 2),
              
              // Text
              RShimmerEffect(width: 55, height: 8),
            ],
          );
        },
      ),
    );
  }
}
