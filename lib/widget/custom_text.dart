
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.text,
    this.color,
    this.textAlign = TextAlign.center,
    this.bold = true,
    this.overflow = false,
    this.size = 15,
  }) : super(key: key);

  final String text;
  final TextAlign textAlign;
  final Color? color;
  final bool bold;
  final bool overflow;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: overflow ? 1 : null,
      overflow: overflow ? TextOverflow.ellipsis : null,
      style: GoogleFonts.ubuntu(
        color: color ?? Colors.black,
        fontSize: size,
        fontWeight: bold ? FontWeight.w800 : FontWeight.w500,
      ),
    );
  }}