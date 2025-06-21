import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shopping_app/utils/constants/colors.dart';
import 'package:shopping_app/utils/constants/sizes.dart';

// A widget for displaying an animated loading indicator with optional text and action button
class RAnimationLoaderWidget extends StatelessWidget {
  /// Default constructor for the RAnimationLoaderWidget.
  ///
  /// Parameters:
  ///   - text: the text to be displayed below the animation
  ///   - animation: the path to the Lottie animation file.
  ///   - showActon: whether to show an action button below the text.
  ///   - actionText: the text to be displayed on the action button.
  ///   - onActionPressed: Callback function to be executed when the action button is pressed.
  const RAnimationLoaderWidget({
    super.key,
    required this.text,
    required this.animation,
    this.showActon = false,
    this.actionText,
    this.onActionPressed,
  });

  final String text;
  final String animation;
  final bool showActon;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(animation, width: MediaQuery.of(context).size.width * 0.8), // Display Lottie Animation
          const SizedBox(height: RSizes.defaultSpace),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: RSizes.defaultSpace),
          showActon
              ? SizedBox(
                  width: 250,
                  child: OutlinedButton(
                    onPressed: onActionPressed,
                    style:
                        OutlinedButton.styleFrom(backgroundColor: RColors.dark),
                    child: Text(
                      actionText!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .apply(color: RColors.light),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
