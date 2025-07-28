import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shopping_app/features/authentication/controls/login/login_controller.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: RColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () => controller.googleSignIn(),
            icon: const Image(
              width: RSizes.iconMd,
              height: RSizes.iconMd,
              image: AssetImage(RImages.google),
            ),
          ),
        ),
        const SizedBox(width: RSizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: RColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              width: RSizes.iconMd,
              height: RSizes.iconMd,
              image: AssetImage(RImages.facebook),
            ),
          ),
        ),
      ],
    );
  }
}
