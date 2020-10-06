//https://medium.com/@mx_tino/flutter-themes-9cebc0fecd1d
//https://stackoverflow.com/questions/53774597/how-to-define-custom-text-theme-in-flutter

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextTheme extends TextTheme {
   final BuildContext context;
   CustomTextTheme(this.context);

   @override
   TextStyle get display1 => GoogleFonts.ptSans(color: Colors.white, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic, fontSize: (MediaQuery.of(this.context).size.width) * 0.18);

   @override
   TextStyle get display2 => GoogleFonts.ptSans(color: Colors.white70, fontWeight: FontWeight.w500, fontSize: (MediaQuery.of(this.context).size.width) * 0.055);

   @override
   TextStyle get display3 => GoogleFonts.ptSans(color: Colors.white70, fontWeight: FontWeight.w500, fontSize: (MediaQuery.of(this.context).size.width) * 0.045);

   @override
   TextStyle get display4 => GoogleFonts.ptSans(color: Colors.white70, fontWeight: FontWeight.w500, fontSize: (MediaQuery.of(this.context).size.width) * 0.04);

   @override
   TextStyle get title => GoogleFonts.ptSans(color: Colors.white54, fontWeight: FontWeight.w500, fontSize: (MediaQuery.of(this.context).size.width) * 0.035);
   @override
   TextStyle get subtitle => GoogleFonts.ptSans(color: Colors.white54, fontWeight: FontWeight.w500, fontSize: (MediaQuery.of(this.context).size.width) * 0.030);
}