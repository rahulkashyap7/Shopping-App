import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/features/authentication/controls/signup/signup_controller.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';
import '../../../utils/helpers/helper_function.dart';

class RTermsAndConditionCheckbox extends StatelessWidget {
  const RTermsAndConditionCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = RHelperFunctions.isDarkMode(context);
    final controller = Get.find<SignupController>();
    return Row(
      children: [
        SizedBox(
            width: 24,
            height: 24,
            child: Obx(() => Checkbox(
                value: controller.privacyPolicy.value,
                onChanged: (value) => controller.privacyPolicy.value =
                    !controller.privacyPolicy.value))),
        const SizedBox(width: RSizes.sm),
        Text.rich(TextSpan(children: [
          TextSpan(
              text: '${RTexts.iAgreeTo} ',
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: '${RTexts.privacyPolicy} ',
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? RColors.white : RColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? RColors.white : RColors.primary,
                  )),
          TextSpan(
              text: '${RTexts.and} ',
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: '${RTexts.termsOfUse} ',
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? RColors.white : RColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? RColors.white : RColors.primary,
                  )),
        ]))
      ],
    );
  }
}
