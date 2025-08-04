import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopping_app/common/widgets/appbar/appbar.dart';
import 'package:shopping_app/common/widgets/images/r_circular_image.dart';
import 'package:shopping_app/common/widgets/texts/section_heading.dart';
import 'package:shopping_app/features/personalization/controls/user_controller.dart';
import 'package:shopping_app/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:shopping_app/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:shopping_app/utils/constants/sizes.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../controls/user_controller.dart';
import '../../controls/user_controller.dart' as controller;

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: RAppBar(showBackArrow: true, title: Text('Profile')),
      // Body
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(RSizes.defaultSpace),
          child: Column(
            children: [
              // Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    RCircularImage(
                        image: RImages.userPic, width: 80, height: 80),
                    TextButton(
                        onPressed: () {}, child: Text('Change Profile Picture'))
                  ],
                ),
              ),

              // Details
              const SizedBox(height: RSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: RSizes.spaceBtwItems),
              RSectionHeading(title: 'Profile Information', showActionButton: false),
              const SizedBox(height: RSizes.spaceBtwItems),

              RProfileMenu(title: 'Name', value: controller.user.value.fullName, onPressed: () => Get.to(() => const ChangeName())),
              RProfileMenu(onPressed: () {}, title: 'Username', value: controller.user.value.username),

              const SizedBox(height: RSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: RSizes.spaceBtwItems),

              // Heading Personal info
              RProfileMenu(title: 'User ID', value: controller.user.value.id, onPressed: () {}, icon: Iconsax.copy),
              RProfileMenu(title: 'Email', value: controller.user.value.email, onPressed: () {}),
              RProfileMenu(title: 'Phone No.', value: controller.user.value.phoneNumber, onPressed: () {}),
              RProfileMenu(title: 'Gender', value: 'Male', onPressed: () {}),
              RProfileMenu(title: 'Date of Birth', value: '16 August 2002', onPressed: () {}),

              const Divider(),
              const SizedBox(height: RSizes.spaceBtwItems),
              
              Center(
                child: TextButton(onPressed: () => controller.deleteAccountWarningPopup(), child: Text('Close Account', style: TextStyle(color: Colors.red))),
              )
            ],
          ),
        ),
      ),
    );
  }
}

