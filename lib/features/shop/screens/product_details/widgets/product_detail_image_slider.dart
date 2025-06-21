import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widget/curved_edges_widgets.dart';
import '../../../../../common/widgets/icons/r_circular_icon.dart';
import '../../../../../common/widgets/images/R_rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_function.dart';


class RProductImageSlider extends StatelessWidget {
  const RProductImageSlider({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = RHelperFunctions.isDarkMode(context);
    return RCurvedEdgeWidget(
      child: Container(
        color: dark ? RColors.darkerGrey : RColors.light,
        child: Stack(
          children: [
            const SizedBox(
              // Main large image
                height: 400,
                child: Padding(
                  padding:
                  EdgeInsets.all(RSizes.productImageRadius * 2),
                  child: Center(
                      child: Image(
                          image: AssetImage(RImages.productImage3))),
                )),

            // Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: RSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: 4,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => const SizedBox(width: RSizes.spaceBtwItems),
                  itemBuilder: (_, index) => RRoundedImage(
                      width: 80,
                      backgroundColor: dark ? RColors.dark : RColors.white,
                      border: Border.all(color: RColors.primary),
                      padding: EdgeInsets.all(RSizes.sm),
                      imageUrl: RImages.productImage4
                  ),
                ),
              ),
            ),

            // Appbar Icons
            RAppBar(
              showBackArrow: true,
              actions: [
                RCircularIcon(icon: Iconsax.heart5, color: Colors.red),
              ],
            )
          ],
        ),
      ),
    );
  }
}