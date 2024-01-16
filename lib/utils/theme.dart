import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  AppColors._();
  static Color primaryColor = const Color(0xFFA279C6);
  static Color white = const Color(0xFFFFFFFF);
  static Color secondrayColor = const Color(0xFF72588B);
  static Color error = const Color(0xFFFC0000);
  static Color transparentPrimaryrimary =
      const Color(0xFFA279C6).withOpacity(.5);
}

class AppStyles {
  static TextStyle general(double? size, FontWeight? weight,
          {Color color = Colors.black}) =>
      GoogleFonts.inter(
          fontSize: size == null ? 14 : size,
          fontWeight: weight ?? FontWeight.w400,
          color: color);
}
