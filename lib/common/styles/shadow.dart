import 'package:flutter/material.dart';
import 'package:shopping_app/utils/constants/colors.dart';

class RShadowStyle {
  static final verticalProductShadow = BoxShadow(
    color: RColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2)
  );

  static final horizontalProductShadow = BoxShadow(
    color: RColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2)
  );
}