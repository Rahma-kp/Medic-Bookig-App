
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medic/view/userside/appoinment/doctor_profile_screen.dart';

class profileContainer extends StatelessWidget {
  const profileContainer({
    super.key,
    required this.widget,
  });

  final DoctorProfile widget;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            height: 450,
            width: 400,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Color.fromARGB(255, 123, 125, 125),
                  Color.fromARGB(255, 241, 239, 239),
                  Color.fromARGB(255, 255, 255, 255)
                ],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            height: 290,
            width: 400,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 71, 153, 124),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        Positioned(
          left: 110,
          top: 50,
          child: Column(
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(widget.doctor.image!),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Dr.${widget.doctor.fullName!}",
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                widget.doctor.category!,
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Positioned(
            left: 60,
            bottom: 120,
            child: Text(
              "Fee",
              style: GoogleFonts.montserrat(
                  fontSize: 15,
                  color: const Color.fromARGB(255, 59, 58, 58),
                  fontWeight: FontWeight.w700),
            )),
        Positioned(
          left: 60,
          bottom: 80,
          child: Text("₹${widget.doctor.fee}",
              style: GoogleFonts.montserrat(
                  fontSize: 25, fontWeight: FontWeight.w700)),
        ),
        Positioned(
          bottom: 50,
          left: 150,
          child: Container(
            width: 2,
            height: 100,
            color: const Color.fromARGB(255, 81, 80, 80),
          ),
        ),
        Positioned(
          left: 170,
          bottom: 120,
          child: Text("Available On",
              style: GoogleFonts.montserrat(
                  fontSize: 15, fontWeight: FontWeight.w500)),
        ),
        Positioned(
          left: 170,
          bottom: 90,
          child: Text(widget.doctor.workingDays!,
              style: GoogleFonts.montserrat(
                  fontSize: 17, fontWeight: FontWeight.bold)),
        ),
        Positioned(
          bottom: 60,
          left: 170,
          child: Text(
              "${widget.doctor.startTime} to ${widget.doctor.endTime}",
              style: GoogleFonts.montserrat(
                  fontSize: 17, fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}
