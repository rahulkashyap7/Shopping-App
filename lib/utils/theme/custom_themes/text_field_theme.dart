import 'package:flutter/material.dart';
import 'package:shopping_app/utils/constants/colors.dart';
import 'package:shopping_app/utils/constants/sizes.dart';

class RTextFieldTheme {
  RTextFieldTheme._();

  static InputDecorationTheme lightTextFieldTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: RColors.darkGrey,
    suffixIconColor: RColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: 14, inputFieldHeight),
    labelStyle: const TextStyle().copyWith(fontSize: RSizes.fontSm, color: Colors.black),
    hintStyle: const TextStyle().copyWith(fontSize: RSizes.fontMd, color: Colors.black),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: Colors.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(RSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: Colors.grey)
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(RSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: RColors.grey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(RSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: RColors.dark),
    ),
    errorBorder : const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(RSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: RColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 2, color: RColors.warning),
    ),
  );

  static InputDecorationTheme darkTextFieldTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: RColors.darkGrey,
    suffixIconColor: RColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: 14, inputFieldHeight),
    labelStyle: const TextStyle().copyWith(fontSize: RSizes.fontMd, color: RColors.white),
    hintStyle: const TextStyle().copyWith(fontSize: RSizes.fontSm, color: RColors.white),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: RColors.white.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(RSizes.inputFieldRadius),
        borderSide: const BorderSide(width: 1, color: RColors.darkGrey)
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(RSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: RColors.darkGrey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(RSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: RColors.white),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(RSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: RColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(RSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: RColors.warning),
    ),
  );


}