import 'package:flutter/material.dart';
import 'package:shopping_app/utils/constants/colors.dart';
import 'package:shopping_app/utils/device/device_utility.dart';
import 'package:shopping_app/utils/helpers/helper_function.dart';

class RTabBar extends StatelessWidget implements PreferredSizeWidget {
  const RTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = RHelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? RColors.black : RColors.white,
      child: TabBar(tabs: tabs,
      isScrollable: true,
        indicatorColor: RColors.primary,
        labelColor: dark ? RColors.white : RColors.primary,
        unselectedLabelColor: RColors.darkGrey,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(RDeviceUtils.getAppBarHeight());

}
