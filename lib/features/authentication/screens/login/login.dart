import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/common/styles/spacing_styles.dart';
import 'package:shopping_app/features/authentication/controls/login/login_controller.dart';
import 'package:shopping_app/features/authentication/screens/login/widgets/login_form.dart';
import 'package:shopping_app/features/authentication/screens/login/widgets/login_header.dart';
import 'package:shopping_app/utils/constants/text_strings.dart';
import 'package:shopping_app/utils/helpers/helper_function.dart';

import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';
import '../../../../utils/constants/sizes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the login controller
    Get.put(LoginController());

    final dark = RHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: RSpacingStyles.paddingWithAppBarHeight,
          child: Column(
            children: [
              // Logo, Title, and Subtitle
              LoginHeader(dark: dark),

              // Form
              LoginForm(),

              // Divider
              FormDivider(dividerText: RTexts.orSignInWith.capitalize!),

              const SizedBox(height: RSizes.spaceBtwSections),

              // footer
              const SocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
