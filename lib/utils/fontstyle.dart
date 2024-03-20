import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_maker/utils/icons.dart';

TextStyle fontsize17() {
  return GoogleFonts.lato(
      color: Colors.black,
      fontWeight: FontWeight.w600,
      fontSize: 17,
      letterSpacing: spacing);
}

TextStyle fontsize15() {
  return GoogleFonts.lato(
      color: Colors.grey.shade700,
      fontWeight: FontWeight.w500,
      fontSize: 15,
      letterSpacing: spacing);
}

TextStyle dynamicFontSize(double size, Color color, FontWeight weight) {
  return GoogleFonts.lato(
      color: color, fontWeight: weight, fontSize: size, letterSpacing: spacing);
}

TextStyle fontsize25() {
  return GoogleFonts.lato(
      color: Colors.black, fontWeight: FontWeight.w700, fontSize: 25);
}

BoxDecoration dataContainerShadow() {
  return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            offset: const Offset(0, 2),
            blurRadius: 1,
            spreadRadius: 1)
      ]);
}
