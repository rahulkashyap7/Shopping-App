import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopping_app/features/authentication/controls/signup/signup_controller.dart';
import 'package:shopping_app/features/authentication/screens/signup/verify_email.dart';
import 'package:shopping_app/utils/validators/validation.dart';
import '../../../../../common/widgets/terms_and_conditions_checkbox/terms_condition_checkbox.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_function.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignupController>();
    final dark = RHelperFunctions.isDarkMode(context);
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          // First & Last Name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      RValidator.validateEmptyText('First Name', value),
                  expands: false,
                  decoration: InputDecoration(
                      labelText: RTexts.firstName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(width: RSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) =>
                      RValidator.validateEmptyText('Last Name', value),
                  expands: false,
                  decoration: InputDecoration(
                      labelText: RTexts.lastName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
            ],
          ),
          const SizedBox(height: RSizes.spaceBtwInputFields),

          // Username
          TextFormField(
            controller: controller.username,
            validator: (value) =>
                RValidator.validateEmptyText('Username', value),
            expands: false,
            decoration: InputDecoration(
                labelText: RTexts.username,
                prefixIcon: Icon(Iconsax.user_edit)),
          ),
          const SizedBox(height: RSizes.spaceBtwInputFields),

          // email
          TextFormField(
            controller: controller.email,
            validator: (value) => RValidator.validateEmail(value),
            expands: false,
            decoration: InputDecoration(
                labelText: RTexts.email, prefixIcon: Icon(Iconsax.direct)),
          ),
          const SizedBox(height: RSizes.spaceBtwInputFields),

          // Phone Number
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => RValidator.validatePhoneNumber(value),
            expands: false,
            decoration: InputDecoration(
                labelText: RTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
          ),
          const SizedBox(height: RSizes.spaceBtwInputFields),

          // Password
          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: (value) => RValidator.validatePassword(value),
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                labelText: RTexts.password,
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                    icon: Icon(controller.hidePassword.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye)),
              ),
            ),
          ),
          const SizedBox(height: RSizes.spaceBtwInputFields),

          // Terms & Conditions checkbox
          RTermsAndConditionCheckbox(),

          const SizedBox(height: RSizes.spaceBtwSections),
          // SignUp Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.signup(),
              child: const Text(RTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
