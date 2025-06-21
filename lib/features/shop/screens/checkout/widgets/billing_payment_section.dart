import 'package:flutter/material.dart';
import 'package:shopping_app/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:shopping_app/common/widgets/texts/section_heading.dart';
import 'package:shopping_app/utils/constants/colors.dart';
import 'package:shopping_app/utils/constants/sizes.dart';
import 'package:shopping_app/utils/helpers/helper_function.dart';
import '../../../../../utils/constants/image_strings.dart';

class RBillingPaymentSection extends StatelessWidget {
  const RBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = RHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        RSectionHeading(title: 'Payment Method', buttonTitle: 'Change', onPressed: () {}),
        const SizedBox(height: RSizes.spaceBtwItems / 2),
        Row(
          children: [
            RRoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: dark ? RColors.light : RColors.white,
              padding: EdgeInsets.all(RSizes.sm),
              child: const Image(image: AssetImage(RImages.payPal), fit: BoxFit.contain),
            ),
            const SizedBox(width: RSizes.spaceBtwItems / 2),
            Text('Paypal', style: Theme.of(context).textTheme.bodyLarge),
          ],
        )
      ],
    );
  }
}
