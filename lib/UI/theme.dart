import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// MaterialColor primaryClr = buildMaterialColor(blueClr);
const Color bgDark1Clr = Color(0xFF575757);
const Color greenClr = Color.fromARGB(255, 6, 97, 3);
const Color inputsBGkClr = Color(0xFF696E6F);
const Color greyBGkClr = Color(0xFFD9D9D9);
const Color whitekClr = Color(0xFFFFFFFF);
const Color orangeTextClr = Color(0xFFFF5722);
const Color backgroundDark2kClr = Color(0xFF3A4750);

class Themes {
  static TextStyle header2Style = TextStyle(
    fontFamily: GoogleFonts.roboto().fontFamily,
    color: whitekClr,
    letterSpacing: 2,
    fontSize: 28,
    fontWeight: FontWeight.w900,
  );
  static TextStyle header3Style = TextStyle(
    color: Colors.blueGrey,
    fontSize: 20,
    fontWeight: FontWeight.bold,
    fontFamily: GoogleFonts.roboto().fontFamily,
    letterSpacing: 2,
  );

  static TextStyle notification = TextStyle(
      fontFamily: GoogleFonts.lora().fontFamily,
      color: whitekClr,
      fontSize: 16,
      letterSpacing: 0.4,
      fontWeight: FontWeight.bold);

  static TextStyle importantText = TextStyle(
    fontFamily: GoogleFonts.roboto().fontFamily,
    color: orangeTextClr,
    fontSize: 20,
    letterSpacing: 1,
    fontWeight: FontWeight.w900,
  );
  static TextStyle mtitle = TextStyle(
    fontFamily: GoogleFonts.roboto().fontFamily,
    color: whitekClr,
    fontSize: 14, 
    fontWeight: FontWeight.bold,
  );
}
