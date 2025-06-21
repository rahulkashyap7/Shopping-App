import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopping_app/common/widgets/appbar/appbar.dart';
import 'package:shopping_app/common/widgets/list_tile/settings_menu_tiles.dart';
import 'package:shopping_app/common/widgets/texts/section_heading.dart';
import 'package:shopping_app/utils/constants/sizes.dart';

import '../../../../common/widgets/custom_shapes/container/primary_header_container.dart';
import '../../../../common/widgets/list_tile/user_profile_tile.dart';
import '../../../shop/screens/cart/cart.dart';
import '../../../shop/screens/order/order.dart';
import '../address/address.dart';
import '../profile/profile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          // Header
          children: [
            RPrimaryHeaderContainer(child: Column(
              children: [
                RAppBar(title: Text('Account', style: Theme.of(context).textTheme.headlineMedium!.apply(color: Colors.white))),
                // User profile card
                RUserProfileTile(onPressed: () => Get.to(() => const ProfileScreen())),
                const SizedBox(height: RSizes.spaceBtwSections),
              ],
            ),
            ),

            // Body
            Padding(padding: EdgeInsets.all(RSizes.defaultSpace),
            child: Column(
              children: [
                // Account Settings
                RSectionHeading(title: 'Account Settings', showActionButton: false),
                SizedBox(height: RSizes.spaceBtwItems),
                RSettingsMenuTiles(icon: Iconsax.safe_home, title: 'My Address', subTitle: 'Set delivery address', onTap: () => Get.to(() => const UserAddressScreen())),
                RSettingsMenuTiles(icon: Iconsax.shopping_cart, title: 'My Cart', subTitle: 'Add, remove product and move to checkout', onTap: () => Get.to(() => const CartScreen())),
                RSettingsMenuTiles(icon: Iconsax.bag_tick, title: 'My Order', subTitle: 'In-progress and Completed orders.', onTap: () => Get.to(() => const OrderScreen())),
                RSettingsMenuTiles(icon: Iconsax.bank, title: 'Bank Account', subTitle: 'Withdraw balance to your bank account', onTap: () {}),
                RSettingsMenuTiles(icon: Iconsax.discount_shape, title: 'My Coupons', subTitle: 'List of all the discounted coupons.', onTap: () {}),
                RSettingsMenuTiles(icon: Iconsax.notification, title: 'Notifications', subTitle: 'Set any kind of notification messages', onTap: () {}),
                RSettingsMenuTiles(icon: Iconsax.security_card, title: 'Account Privacy', subTitle: 'Manage data usage and connected accounts', onTap: () {}),
                
                // App Settings
                SizedBox(height: RSizes.spaceBtwSections),
                RSectionHeading(title: 'App Settings', showActionButton: false),
                SizedBox(height: RSizes.spaceBtwItems),
                RSettingsMenuTiles(icon: Iconsax.document_upload, title: 'Load Data', subTitle: 'Upload data to your Cloud firebase'),
                RSettingsMenuTiles(
                    icon: Iconsax.location,
                    title: 'Geolocation',
                    subTitle: 'Get recommendation based on location',
                    trailing: Switch(value: true, onChanged: (value) {}),
                ),
                RSettingsMenuTiles(
                  icon: Iconsax.security_user,
                  title: 'Safe Mode',
                  subTitle: 'Search result is safe for all ages',
                  trailing: Switch(value: false, onChanged: (value) {}),
                ),
                RSettingsMenuTiles(
                  icon: Iconsax.image,
                  title: 'HD Image Quality',
                  subTitle: 'Set image quality to be seen',
                  trailing: Switch(value: true, onChanged: (value) {}),
                ),

                // Logout Button
                const SizedBox(height: RSizes.spaceBtwSections),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(onPressed: () {}, child: const Text('Logout')),
                ),
                const SizedBox(height: RSizes.spaceBtwSections * 2.5),
              ],
            ),)
          ],
        ),
      ),
    );
  }
}

