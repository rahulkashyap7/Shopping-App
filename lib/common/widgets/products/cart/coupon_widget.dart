import 'package:flutter/material.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_function.dart';
import '../../custom_shapes/container/rounded_container.dart';

class RCouponCode extends StatelessWidget {
  const RCouponCode({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = RHelperFunctions.isDarkMode(context);
    return RRoundedContainer(
      showBorder: true,
      backgroundColor: dark ? RColors.dark : RColors.white,
      padding: const EdgeInsets.only(
          top: RSizes.sm, bottom: RSizes.sm, right: RSizes.sm, left: RSizes.md),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Have a promo code? Enter here',
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),

          // Button
          SizedBox(
              width: 80,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: dark
                      ? RColors.white.withOpacity(0.5)
                      : RColors.dark.withOpacity(0.5),
                  backgroundColor: RColors.grey.withOpacity(0.2),
                  side: BorderSide(color: RColors.grey.withOpacity(0.1)),
                ),
                child: Text('Apply'),
              ),
          ),
        ],
      ),
    );
  }
}
