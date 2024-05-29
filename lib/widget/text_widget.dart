import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

Widget poppinsText({text, color, fontWeight, double? fontSize, textAlign, overflow}) {
  return Text(text,
      overflow: overflow,
      textAlign: textAlign,
      style: GoogleFonts.poppins(
          color: color, fontWeight: fontWeight, fontSize: fontSize));
}

Widget poppinsHeadText({text, textAlign, double? fontSize, color}) {
  return Text(text,
      textAlign: textAlign,
      style: GoogleFonts.poppins(
          color: color ?? const Color(0xFF101828),
          fontWeight: FontWeight.w600,
          fontSize: fontSize ?? 16));
}

Widget poppinsSmallText({text, color, fontWeight, textAlign}) {
  return Text(text,
      // overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
      style: GoogleFonts.poppins(
          color: color ?? const Color(0xFF101828), fontSize: 12));
}

Widget interHeadText({text}) {
  return Text(text,
      style: GoogleFonts.inter(
          color: const Color(0xFF1A1A1A),
          fontWeight: FontWeight.bold,
          fontSize: 20));
}

Widget interSubText({text, color, fontWeight}) {
  return Text(text,
      style: GoogleFonts.inter(
          color: color ?? const Color(0xFF1A1A1A),
          fontWeight: fontWeight ?? FontWeight.w400,
          fontSize: 14));
}


  Widget costumParagraphText(BuildContext context,
      {required String text,
      TextAlign? textAlign,
      Color? color,
      bool bold = false,
      // int maxLine = 2,
      int trimLength = 240,
      double size = 15}) {
    return ReadMoreText(
      text,
      textAlign: textAlign ?? TextAlign.justify,
      // trimLines: maxLine,
      trimLength: trimLength,
      style: GoogleFonts.montserrat(
        color: color ?? Colors.black,
        fontSize: size,
        fontWeight: bold ? FontWeight.bold : FontWeight.w500,
      ),
    );
  }

class TextsWidget {
  Widget costumParagraphText(BuildContext context,
      {required String text,
      TextAlign? textAlign,
      Color? color,
      bool bold = false,
      // int maxLine = 2,
      int trimLength = 240,
      double size = 13}) {
    return ReadMoreText(
      text,
      textAlign: textAlign ?? TextAlign.justify,
      // trimLines: maxLine,
      trimLength: trimLength,
      style: GoogleFonts.montserrat(
        color: color ?? Colors.black,
        fontSize: size,
        fontWeight: bold ? FontWeight.bold : FontWeight.w500,
      ),
    );
  }
}
  