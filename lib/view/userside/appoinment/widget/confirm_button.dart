
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class confirmButton extends StatelessWidget {
  const confirmButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 200,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 71, 153, 124),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          "Confirm Schedule",
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }
}
