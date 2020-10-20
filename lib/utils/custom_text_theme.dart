import 'package:flutter/material.dart';
import 'package:flutterweatherapp/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextTheme extends TextTheme{
   final BuildContext context;
   CustomTextTheme(this.context);

   @override
   TextStyle get display1 => GoogleFonts.ptSans(color: Colors.white, fontWeight: FontWeight.w500, shadows: [Shadow(blurRadius: 3,
       color: Colors.white54, offset: Offset(1.0, 1.0))], fontSize: 8.5 * SizeConfig.textMultiplier);

   @override
   TextStyle get display2 => GoogleFonts.ptSans(color: Colors.white.withOpacity(0.8), shadows: [Shadow(blurRadius: 3,
       color: Colors.black45, offset: Offset(2, 1))], fontWeight: FontWeight.w500, fontSize: 3 * SizeConfig.textMultiplier);

   @override
   TextStyle get display3 => GoogleFonts.ptSans(color: Colors.white70, shadows: [Shadow(blurRadius: 3,
       color: Colors.black45, offset: Offset(2, 1))], fontWeight: FontWeight.w500, fontSize: 2.35 * SizeConfig.textMultiplier);

   @override
   TextStyle get display4 => GoogleFonts.ptSans(color: Colors.white70, shadows: [Shadow(blurRadius: 3,
       color: Colors.black45, offset: Offset(2, 1))], fontWeight: FontWeight.w500, fontSize: 2.2 * SizeConfig.textMultiplier);

   @override
   TextStyle get title => GoogleFonts.ptSans(color: Colors.white54, shadows: [Shadow(blurRadius: 3,
       color: Colors.black45, offset: Offset(2, 1))], fontWeight: FontWeight.w500, fontSize: 1.77 * SizeConfig.textMultiplier);

   @override
   TextStyle get subtitle => GoogleFonts.ptSans(color: Colors.white54, shadows: [Shadow(blurRadius: 3,
       color: Colors.black45, offset: Offset(2, 1))], fontWeight: FontWeight.w500, fontSize: 1.7 * SizeConfig.textMultiplier);

   @override
  TextStyle get body1 => GoogleFonts.ptSans(color: Colors.white60, shadows: [Shadow(blurRadius: 3,
       color: Colors.black26, offset: Offset(2, 2))], fontStyle: FontStyle.italic, fontWeight: FontWeight.w300, fontSize: 2.32 * SizeConfig.textMultiplier, decoration: TextDecoration.none);

   TextStyle get warning => GoogleFonts.ptSans(color: Colors.white30, fontStyle: FontStyle.italic, fontWeight: FontWeight.w400, fontSize: 2.45 * SizeConfig.textMultiplier);

}