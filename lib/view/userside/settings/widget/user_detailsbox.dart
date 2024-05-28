import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsBox extends StatelessWidget {
  final String text1, text2;
  final double top;
  final double left;
  final Color clr;
  final Color clr1;
  final Color clr2;
  const DetailsBox({
    super.key,
    required this.text1,
    required this.text2,
    required this.top,
    required this.left,
    required this.clr,
    required this.clr1,
    required this.clr2,
  });

  @override
  Widget build(BuildContext context) {
        Size size = MediaQuery.of(context).size;

    return Positioned(
      top: top,
      left: left,
      child: Container(
        height: 100,
        width: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(text1,    style: GoogleFonts.montserrat(color:clr1,
                        fontSize: size.width * 0.05, fontWeight: FontWeight.w600),),
            Text(text2,    style: GoogleFonts.montserrat(color:clr2,
                        fontSize: size.width * 0.04, fontWeight: FontWeight.w600)),
          ],
        ),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 50, 48, 48).withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ], color:clr, borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
