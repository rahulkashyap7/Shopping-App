import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/utils/constants/sizes.dart';
import 'package:shopping_app/utils/constants/text_strings.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/helper_function.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => Get.back(), icon: Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(RSizes.defaultSpace),
        child: Column(
          children: [
            // Image
            Image(
              image: AssetImage(RImages.verifyEmail), // TODO change this image
              width: RHelperFunctions.screenWidth() * 0.6,
            ),
            const SizedBox(height: RSizes.spaceBtwSections),

            // Title & Subtitle
            Text(
              RTexts.changeYourPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: RSizes.spaceBtwItems),
            Text(
              RTexts.changeYourPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: RSizes.spaceBtwSections),

            // Buttons
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: () {}, child: Text(RTexts.done))),
            const SizedBox(height: RSizes.spaceBtwSections),

            SizedBox(
                width: double.infinity,
                child: TextButton(onPressed: () {}, child: Text(RTexts.resendEmail))),
          ],
        ),
        ),
      ),
    );
  }
}
