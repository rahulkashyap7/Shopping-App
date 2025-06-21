import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/features/authentication/controls/onboarding/onboarding_controller.dart';
import 'package:shopping_app/features/authentication/screens/onboarding/widgets/on_boarding_dot_navigation.dart';
import 'package:shopping_app/features/authentication/screens/onboarding/widgets/on_boarding_next_button.dart';
import 'package:shopping_app/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:shopping_app/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/text_strings.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              OnBoardingPage(
                image: RImages.onBoardingImage1,
                title: RTexts.onBoardingTitle1,
                subTitle: RTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: RImages.onBoardingImage2,
                title: RTexts.onBoardingTitle2,
                subTitle: RTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: RImages.onBoardingImage3,
                title: RTexts.onBoardingTitle3,
                subTitle: RTexts.onBoardingSubTitle3,
              ),
            ],
          ),

          /// Skip Button
          const OnBoardingSkip(),

          /// Dot navigation SmoothPageIndicator
          const OnBoardingDotNavigation(),


          /// Circular button
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}



