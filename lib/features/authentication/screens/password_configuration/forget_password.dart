import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopping_app/features/authentication/controls/forget_password/forget_password_controller.dart';
import 'package:shopping_app/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:shopping_app/utils/validators/validation.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(RSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Headings
            Text(RTexts.forgetPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: RSizes.spaceBtwItems),
            Text(RTexts.forgetPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: RSizes.spaceBtwSections * 2),

            // Text Fields
            Form(
              key: controller.forgetPasswordFormKey,
              child: TextFormField(
                controller: controller.email,
                validator: RValidator.validateEmail,
                decoration: InputDecoration(
                    labelText: RTexts.email,
                    prefixIcon: Icon(Iconsax.direct_right)),
              ),
            ),

            const SizedBox(height: RSizes.spaceBtwSections),

            // Submit Button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.sendPasswordResetEmail(),
                    child: Text(RTexts.submit)))
          ],
        ),
      ),
    );
  }
}
