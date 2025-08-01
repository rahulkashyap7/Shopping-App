import 'package:flutter/material.dart';

class ROutlinedButtonTheme {
  ROutlinedButtonTheme._();

  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.black,
      side: const BorderSide(color: Colors.blue),
      textStyle: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
  );

  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      side: const BorderSide(color: Colors.blue),
      textStyle: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
  );
}