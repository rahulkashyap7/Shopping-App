import 'package:flutter/cupertino.dart';
import 'package:shopping_app/common/widgets/layouts/grid_layout.dart';
import 'package:shopping_app/utils/popups/shimmer.dart';

class RBrandShimmer extends StatelessWidget {
  const RBrandShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return RGridLayout(
      mainAxisExtent: 80,
      itemCount: itemCount,
      itemBuilder: (_, __) => const RShimmerEffect(width: 300, height: 80),
    );
  }
}