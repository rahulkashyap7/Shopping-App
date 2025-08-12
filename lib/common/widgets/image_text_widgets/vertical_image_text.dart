import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_function.dart';
import '../images/r_circular_image.dart';


class RVerticalImageText extends StatelessWidget {
  const RVerticalImageText({
    super.key,
    this.onTap,
    required this.image,
    required this.title,
    this.textColor = RColors.white,
    this.isNetworkImage = true,
    this.backgroundColor,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final bool isNetworkImage;
  final void Function()? onTap; // TODO time

  @override
  Widget build(BuildContext context) {
    final dark = RHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: RSizes.spaceBtwItems),
        child: Column(
          children: [
            // Circular Icon
            RCircularImage(image: image,
              fit: BoxFit.fitWidth,
              padding: RSizes.sm * 1.4,
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundColor,
              overlayColor: RHelperFunctions.isDarkMode(context) ? RColors.light : RColors.dark,
            ),
            // Text
            const SizedBox(height: RSizes.spaceBtwItems / 2),
            SizedBox(
              width: 55,
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}