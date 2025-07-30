import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shopping_app/common/widgets/loaders/loaders.dart';
import 'package:shopping_app/data/repositories/authentication/authentication_repository.dart';
import 'package:shopping_app/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:shopping_app/utils/check_conncetion/network_manager.dart';
import 'package:shopping_app/utils/popups/full_screen_loader.dart';

import '../../../../utils/constants/image_strings.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  // Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  // Send Reset Password Email
  sendPasswordResetEmail() async {
    try {
      // Start Loading
      RFullScreenLoader.openLoadingDialog('Processing your request...', RImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {RFullScreenLoader.stopLoading(); return;}

      // Form validation
      if (!forgetPasswordFormKey.currentState!.validate()){
        RFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      // Remove Loader
      RFullScreenLoader.stopLoading();

      // Show Success Screen
      RLoaders.successSnackBar(title: 'Email Sent', message: 'Email Link Sent to Reset Your Password'.tr);

      // Redirect
      Get.to(() => ResetPassword(email: email.text.trim()));
    } catch (e) {
      // Remove Loader
      RFullScreenLoader.stopLoading();
      RLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      // Start Loading
      RFullScreenLoader.openLoadingDialog('Processing your request...', RImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {RFullScreenLoader.stopLoading(); return;}


      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // Remove Loader
      RFullScreenLoader.stopLoading();

      // Show Success Screen
      RLoaders.successSnackBar(title: 'Email Sent', message: 'Email Link Sent to Reset Your Password'.tr);
    } catch (e) {
      // Remove Loader
      RFullScreenLoader.stopLoading();
      RLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
