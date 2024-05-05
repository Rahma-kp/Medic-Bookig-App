import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medic/widget/payment_confirm_message.dart';

class AppoinmentConfirmScreen extends StatelessWidget {
  const AppoinmentConfirmScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage("assets/doct1.jpeg"),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Appointment Confirm!",
              style: GoogleFonts.montserrat(
                  color: Color.fromARGB(255, 29, 141, 102),
                  fontSize: size.width * 0.05,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: GoogleFonts.montserrat(
                    fontSize: size.width * 0.04,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: "Your Appointment with ",
                    ),
                    TextSpan(
                      text: "Dr. Courtney Herry ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: "on ",
                    ),
                    TextSpan(
                      text: "May 05 ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: "at ",
                    ),
                      TextSpan(
                      text: " 10.00 ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: " is confirmed.",
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Time to appointment:",
              style: GoogleFonts.montserrat(
                fontSize: size.width * 0.04,
              ),
            ),
            Text(
              "2 Days 5 Hours",
              style: GoogleFonts.montserrat(
                fontSize: size.width * 0.04,
                 fontWeight: FontWeight.bold,

              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Amount : ",
                  style: GoogleFonts.montserrat(
                    fontSize: size.width * 0.04,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "100 rupees",
                  style: GoogleFonts.montserrat(
                    fontSize: size.width * 0.04,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 29, 141, 102),
                  ),
                ),
                             ],
            ),
            SizedBox(height: 20,),
             GestureDetector(onTap: (){  
             
           showDialog(context: context, builder:(context) => PaymentConfrimMessage(),);
                },
               child: Container(height: 60,width: 200,child: Center(
                 child: Text("Payment", style: GoogleFonts.montserrat(
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),)
               ),
                    decoration: BoxDecoration(color: Color.fromARGB(255, 29, 141, 102),borderRadius: BorderRadius.circular(20)),),
             )

          ],
        ),
      ),
    );
  }
}
