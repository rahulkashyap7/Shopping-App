import 'package:flutter/cupertino.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/popups/shimmer.dart';

class RBoxesShimmer extends StatelessWidget {
  const RBoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: RShimmerEffect(width: 150, height: 110)),
            SizedBox(width: RSizes.spaceBtwItems),
            Expanded(child: RShimmerEffect(width: 150, height: 110)),
            SizedBox(width: RSizes.spaceBtwItems),
            Expanded(child: RShimmerEffect(width: 150, height: 110)),
          ],
        ), // Row
      ],
    ); // Column
  }
}
