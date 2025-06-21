import 'package:flutter/material.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/product_cart/cart_menu_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';

class RHomeAppBar extends StatelessWidget {
  const RHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RAppBar(title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(RTexts.homeAppbarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: RColors.grey)),
        Text(RTexts.homeAppbarSubTitle, style: Theme.of(context).textTheme.labelSmall!.apply(color: RColors.white)),
      ],
    ),
      actions: [RCartCounterIcon(onPressed: () {}, iconColor: RColors.white)],
    );
  }
}