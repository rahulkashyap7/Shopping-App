import 'package:flutter/material.dart';
import 'package:shopping_app/utils/constants/colors.dart';
import 'package:shopping_app/utils/helpers/helper_function.dart';

class RCircularLoader extends StatelessWidget {
  const RCircularLoader({
    super.key,
    this.size = 64,
    this.strokeWidth = 4,
    this.text,
    this.backgroundColor,
    this.progressColor,
  });

  final double size;
  final double strokeWidth;
  final String? text;
  final Color? backgroundColor;
  final Color? progressColor;

  @override
  Widget build(BuildContext context) {
    final bool isDark = RHelperFunctions.isDarkMode(context);
    final Color resolvedBackground = backgroundColor ??
        (isDark ? RColors.darkContainer : RColors.white);
    final Color resolvedProgress = progressColor ?? RColors.primary;

    final double indicatorSize = size * 0.6;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: resolvedBackground,
            borderRadius: BorderRadius.circular(size),
            boxShadow: [
              if (!isDark)
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
            ],
          ),
          alignment: Alignment.center,
          child: SizedBox(
            width: indicatorSize,
            height: indicatorSize,
            child: CircularProgressIndicator(
              strokeWidth: strokeWidth,
              valueColor: AlwaysStoppedAnimation<Color>(resolvedProgress),
              backgroundColor: resolvedProgress.withOpacity(0.2),
            ),
          ),
        ),
        if (text != null) ...[
          const SizedBox(height: 16),
          Text(
            text!,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );
  }
}
