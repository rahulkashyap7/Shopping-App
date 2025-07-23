import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shopping_app/common/widgets/loaders/loaders.dart';
import 'package:shopping_app/data/repositories/user/user_repository.dart';
import 'package:shopping_app/utils/constants/image_strings.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../data/repositories/user/user_model.dart';
import '../../../../utils/check_conncetion/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../screens/signup/verify_email.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs; // Observable for show/hide password
  final privacyPolicy = true.obs; // Observable for show/hide Privacy Policy
  final email = TextEditingController(); // Controller for email input
  final lastName = TextEditingController(); // Controller for last input
  final username = TextEditingController(); // Controller for username input
  final password = TextEditingController(); // Controller for password input
  final firstName = TextEditingController(); // Controller for firstName input
  final phoneNumber =
      TextEditingController(); // Controller for phone Number input
  GlobalKey<FormState> signupFormKey =
      GlobalKey<FormState>(); // Form key for form validation

  /// -- SignUp
  void signup() async {
    try {
      // Start Loading
      RFullScreenLoader.openLoadingDialog('We are processing your information...', RImages.docerAnimation);

      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      // Form Validation
      if (!signupFormKey.currentState!.validate()) return;


      // Privacy policy Check
      if (!privacyPolicy.value) {
        RLoaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message: 'In order to create account, you must to read and accept the Privacy Policy & Terms of Use.');
        return;
      }

      // Register user in the Firebase Authentication & save user data in the firebase
      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

      // save Authenticate user data in the Firebase Firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUSerRecord(newUser);

      // Remove Loader
      RFullScreenLoader.stopLoading();

      // Show Success Message
      RLoaders.successSnackBar(
          title: 'Congratulations', message: 'Your account has been created! Verify email to continue.');

      // Move to verify Email Screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      // Show some Generic Error to the user
      RLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // Remove loading
      RFullScreenLoader.stopLoading();
    }
  }
}
