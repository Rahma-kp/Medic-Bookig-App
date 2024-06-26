import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medic/model/doctor_model.dart';
import 'package:medic/widget/payment_confirm_message.dart';

class AppoinmentConfirmScreen extends StatelessWidget {
  final DateTime selectedDate;
  final String selectedTimeSlot;
  final DoctorModel doctor;

  const AppoinmentConfirmScreen({
    Key? key,
    required this.selectedDate,
    required this.selectedTimeSlot,
    required this.doctor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String formattedDate = "${selectedDate.toLocal()}".split(' ')[0]; // Format the date as needed

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 122, 182, 159),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(doctor.image!), // Display doctor's profile image
            ),
            SizedBox(height: 15),
            Text(
              "Appointment Confirmed!",
              style: GoogleFonts.montserrat(
                color: Color.fromARGB(255, 29, 141, 102),
                fontSize: size.width * 0.05,
                fontWeight: FontWeight.bold,
              ),
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
                    TextSpan(text: "Your appointment with "),
                    TextSpan(
                      text: "Dr.${doctor.fullName} ",
                      style: GoogleFonts.montserrat(
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: "on "),
                    TextSpan(
                      text: "$formattedDate ",
                      style: GoogleFonts.montserrat(
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: "at "),
                    TextSpan(
                      text: "$selectedTimeSlot ",
                      style: GoogleFonts.montserrat(
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: "is confirmed."),
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
              "2 Days 5 Hours", // This should be dynamically calculated
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
                  "100",
                  style: GoogleFonts.montserrat(
                    fontSize: size.width * 0.05,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Color.fromARGB(255, 29, 141, 102),
                  ),
                ),
                Text(
                  " rupees",
                  style: GoogleFonts.montserrat(
                    fontSize: size.width * 0.05,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 29, 141, 102),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => PaymentConfrimMessage(),
                ).then((_) {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                });
              },
              child: Container(
                height: 60,
                width: 200,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 122, 182, 159),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    "Pay Now",
                    style: GoogleFonts.montserrat(
                      fontSize: size.width * 0.04,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
