import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopping_app/common/widgets/appbar/appbar.dart';
import 'package:shopping_app/common/widgets/images/r_circular_image.dart';
import 'package:shopping_app/common/widgets/texts/section_heading.dart';
import 'package:shopping_app/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:shopping_app/utils/constants/sizes.dart';
import '../../../../utils/constants/image_strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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

              RProfileMenu(onPressed: () {}, title: 'Name', value: 'Rahul Kashyap'),
              RProfileMenu(onPressed: () {}, title: 'Username', value: 'rahul_kashyap'),

              const SizedBox(height: RSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: RSizes.spaceBtwItems),

              // Heading Personal info
              RProfileMenu(title: 'User ID', value: '7700', onPressed: () {}, icon: Iconsax.copy),
              RProfileMenu(title: 'Email', value: 'rahulkashyap@gmail.com', onPressed: () {}),
              RProfileMenu(title: 'Phone No.', value: '9968XXXXXX', onPressed: () {}),
              RProfileMenu(title: 'Gender', value: 'Male', onPressed: () {}),
              RProfileMenu(title: 'Date of Birth', value: '16 August 2002', onPressed: () {}),

              const Divider(),
              const SizedBox(height: RSizes.spaceBtwItems),
              
              Center(
                child: TextButton(onPressed: () {}, child: Text('Close Account', style: TextStyle(color: Colors.red))),
              )
            ],
          ),
        ),
      ),
    );
  }
}

