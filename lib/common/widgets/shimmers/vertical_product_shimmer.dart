import 'package:flutter/cupertino.dart';
import 'package:shopping_app/common/widgets/layouts/grid_layout.dart';
import 'package:shopping_app/utils/popups/shimmer.dart';

import '../../../utils/constants/sizes.dart';

class RVerticalProductShimmer extends StatelessWidget {
  const RVerticalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return RGridLayout(
        itemCount: itemCount,
        itemBuilder: (_, __) => const SizedBox(
              width: 180,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image
                  RShimmerEffect(width: 180, height: 180),
                  SizedBox(height: RSizes.spaceBtwItems),

                  // Texts
                  RShimmerEffect(width: 160, height: 15),
                  SizedBox(height: RSizes.spaceBtwItems / 2),
                  RShimmerEffect(width: 110, height: 15),
                ],
              ),
            ));
  }
}
