import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopping_app/features/authentication/screens/signup/signup.dart';
import '../../../../../navigation_menu.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../password_configuration/forget_password.dart';


class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: RSizes.spaceBtwSections),
          child: Column(
            children: [
              // Email
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: RTexts.email),
              ),
              const SizedBox(height: RSizes.spaceBtwInputFields),

              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.password_check),
                  labelText: RTexts.password,
                  suffixIcon: Icon(Iconsax.eye_slash),
                ),
              ),
              const SizedBox(height: RSizes.spaceBtwInputFields / 2),

              // Remember Me & Forget Password
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Remember Me
                  Row(
                    children: [
                      Checkbox(value: true, onChanged: (value) {}),
                      const Text(RTexts.rememberMe),
                    ],
                  ),

                  // Forget Password
                  TextButton(
                      onPressed: () => Get.to(() => ForgetPassword()), child: Text(RTexts.forgetPassword)),
                ],
              ),
              const SizedBox(height: RSizes.spaceBtwSections),

              // Sign In Btn
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.to(() => const NavigationMenu()), child: Text(RTexts.logIn))),
              const SizedBox(height: RSizes.spaceBtwItems),

              SizedBox(width: double.infinity, child: OutlinedButton(onPressed: () => Get.to(() => SignupScreen()), child: Text(RTexts.createAccount))),
            ],
          ),
        ));
  }
}