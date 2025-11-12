import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_function.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    final isLottieAsset = image.toLowerCase().endsWith('.json');
    final assetWidth = RHelperFunctions.screenWidth() * 0.8;
    final assetHeight = RHelperFunctions.screenHeight() * 0.6;

    return Padding(
      padding: const EdgeInsets.all(RSizes.defaultSpace),
      child: Column(
        children: [
          if (isLottieAsset)
            Lottie.asset(
              image,
              width: assetWidth,
              height: assetHeight,
              fit: BoxFit.contain,
            )
          else
            Image.asset(
              image,
              width: assetWidth,
              height: assetHeight,
            ),
          Text(title,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center),
          const SizedBox(height: RSizes.spaceBtwItems),
          Text(subTitle,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
