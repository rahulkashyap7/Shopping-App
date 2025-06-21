import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/common/widgets/success_screen/success_screen.dart';
import 'package:shopping_app/data/repositories/authentication/authentication_repository.dart';
import 'package:shopping_app/features/authentication/controls/signup/verify_email_controller.dart';
import 'package:shopping_app/features/authentication/screens/login/login.dart';
import 'package:shopping_app/utils/constants/image_strings.dart';
import 'package:shopping_app/utils/constants/text_strings.dart';
import 'package:shopping_app/utils/helpers/helper_function.dart';

import '../../../../utils/constants/sizes.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => AuthenticationRepository.instance.logout(), icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        // padding to give Default equal space on all sides in all screens.
        child: Padding(padding: EdgeInsets.all(RSizes.defaultSpace),
        child: Column(
          children: [

            // Images
            Image(image: AssetImage(RImages.verifyEmail), width: RHelperFunctions.screenWidth() * 0.6,),
            const SizedBox(height: RSizes.spaceBtwSections),
            
            // Title and Subtitle
            Text(RTexts.confirmEmail, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
            const SizedBox(height: RSizes.spaceBtwItems),
            Text(email ?? '', style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center),
            const SizedBox(height: RSizes.spaceBtwItems),
            Text(RTexts.confirmEmailSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
            const SizedBox(height: RSizes.spaceBtwSections),

            // Buttons
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: () => controller.checkEmailVerificationStatus(),
                child: Text(RTexts.uflContinue))
            ),
            const SizedBox(height: RSizes.spaceBtwItems),
            SizedBox(width: double.infinity, child: TextButton(onPressed: () => controller.sendEmailVerification(), child: Text(RTexts.resendEmail))),
          ],
        ),
        ),

      ),
    );
  }
}
