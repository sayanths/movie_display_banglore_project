import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

gFontsSans({double sz = 16, double ls = 0, FontWeight fw = FontWeight.normal, Color cl = Colors.black}) {
  return GoogleFonts.firaSansCondensed(
    fontSize: sz,
    letterSpacing: ls,
    fontWeight: fw,
    color: cl,
  );
}