import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
Widget PaymentConfrimMessage(){
  return AlertDialog(backgroundColor:Color.fromARGB(255, 29, 141, 102) ,
    content: SingleChildScrollView(
      child: ListBody(children: [
        Text("Your Apooinmen with Dr. Courtney Herry on May at 10:00 is Confirmed ", style: GoogleFonts.montserrat(
                    fontSize: 20,
                    color:Colors.white)),
                     Icon(Icons.verified_user,size: 40,color: Colors.white,)
      ]),
    ),
  );
}