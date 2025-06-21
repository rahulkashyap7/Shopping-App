import 'package:flutter/material.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../controls/onboarding/onboarding_controller.dart';


class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: RDeviceUtils.getAppBarHeight(),
      right: RSizes.defaultSpace,
      child: TextButton(
        onPressed: () => OnboardingController.instance.skipPage(),
        child: const Text('Skip'),
      ),
    );
  }
}