import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/common/widgets/login_signup/form_divider.dart';
import 'package:shopping_app/features/authentication/controls/signup/signup_controller.dart';
import 'package:shopping_app/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:shopping_app/utils/constants/sizes.dart';
import 'package:shopping_app/utils/constants/text_strings.dart';

import '../../../../common/widgets/login_signup/social_buttons.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the signup controller
    Get.put(SignupController());

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(RSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(RTexts.signupTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: RSizes.spaceBtwSections),
              // Form
              SignUpForm(),
              const SizedBox(height: RSizes.spaceBtwSections),

              // Divider
              FormDivider(dividerText: RTexts.orSignUpWith.capitalize!),
              const SizedBox(height: RSizes.spaceBtwSections),

              // Social Buttons
              const SocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
