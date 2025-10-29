import 'package:flutter/cupertino.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/popups/shimmer.dart';

class RListsTileShimmer extends StatelessWidget {
  const RListsTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            RShimmerEffect(width: 50, height: 50, radius: 50),
            SizedBox(width: RSizes.spaceBtwItems),
            Column(
              children: [
                RShimmerEffect(width: 100, height: 15),
                SizedBox(height: RSizes.spaceBtwItems / 2),
                RShimmerEffect(width: 80, height: 12),
              ],
            ), // Column
          ],
        ), // Row
      ],
    ); // Column
  }
}
