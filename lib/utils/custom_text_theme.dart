import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextTheme extends TextTheme {
   final BuildContext context;
   CustomTextTheme(this.context);

   @override
   TextStyle get display1 => GoogleFonts.ptSans(color: Colors.white, fontWeight: FontWeight.w500, shadows: [Shadow(blurRadius: 3, color: Colors.white54, offset: Offset(1.0, 1.0))], fontSize: (MediaQuery.of(this.context).size.width) * 0.175);
   //TextStyle get display1 => GoogleFonts.ptSans(color: Colors.white, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic, shadows: [Shadow(blurRadius: 3, color: Colors.white54, offset: Offset(1.0, 1.0))], fontSize: (MediaQuery.of(this.context).size.width) * 0.18);

   @override
   TextStyle get display2 => GoogleFonts.ptSans(color: Colors.white70, fontWeight: FontWeight.w500, fontSize: (MediaQuery.of(this.context).size.width) * 0.055);

   @override
   TextStyle get display3 => GoogleFonts.ptSans(color: Colors.white70, fontWeight: FontWeight.w500, fontSize: (MediaQuery.of(this.context).size.width) * 0.04);

   @override
   TextStyle get display4 => GoogleFonts.ptSans(color: Colors.white70, fontWeight: FontWeight.w500, fontSize: (MediaQuery.of(this.context).size.width) * 0.035);

   @override
   TextStyle get title => GoogleFonts.ptSans(color: Colors.white54, fontWeight: FontWeight.w500, fontSize: (MediaQuery.of(this.context).size.width) * 0.032);

   @override
   TextStyle get subtitle => GoogleFonts.ptSans(color: Colors.white54, fontWeight: FontWeight.w500, fontSize: (MediaQuery.of(this.context).size.width) * 0.03);

   @override
  TextStyle get body1 => GoogleFonts.ptSans(color: Colors.white70, fontStyle: FontStyle.italic, fontWeight: FontWeight.w300, fontSize: (MediaQuery.of(this.context).size.width) * 0.035);
}