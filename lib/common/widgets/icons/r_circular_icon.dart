import 'package:flutter/material.dart';
import 'package:shopping_app/utils/helpers/helper_function.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class RCircularIcon extends StatelessWidget {
  const RCircularIcon({
    super.key,
    required this.icon,
    this.width,
    this.height,
    this.size = RSizes.lg,
    this.onPressed,
    this.color,
    this.backgroundColor,
  });

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor != null
            ? backgroundColor!
            : RHelperFunctions.isDarkMode(context)
                ? RColors.black.withOpacity(0.9)
                : RColors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(onPressed: onPressed, icon: Icon(icon, color: color, size: size)),
    );
  }
}
