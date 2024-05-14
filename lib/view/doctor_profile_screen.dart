import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medic/view/appoinment/appoinment_screen.dart';
// import 'package:medic/view/appoinment/payment_confirm_screen.dart';

class DoctorProfile extends StatefulWidget {
  const DoctorProfile({Key? key}) : super(key: key);

  @override
  State<DoctorProfile> createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  bool isSummaryExpanded = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 241, 240, 240),
        centerTitle: true,
        title: Text(
          'Doctor profile',
          style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 241, 240, 240),
      body: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  height: 450,
                  width: 400,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Color.fromARGB(255, 125, 167, 150),
                        Color.fromARGB(255, 227, 225, 225),
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
                    color: Color.fromARGB(255, 71, 153, 124),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              Positioned(
                left: 140,
                top: 50,
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage("assets/doct.jpeg"),
                ),
              ),
              Positioned(
                left: 110,
                top: 180,
                child: Text(
                  "Dr. Courtney Herry ",
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Positioned(
                left: 135,
                top: 220,
                child: Text(
                  "Neuro Medicine",
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Positioned(
                  left: 60,
                  bottom: 120,
                  child: Text(
                    "Fee",
                    style: GoogleFonts.montserrat(
                        fontSize: 15,
                        color: Color.fromARGB(255, 59, 58, 58),
                        fontWeight: FontWeight.w700),
                  )),
              Positioned(
                left: 60,
                bottom: 80,
                child: Text("₹100",
                    style: GoogleFonts.montserrat(
                        fontSize: 25, fontWeight: FontWeight.w700)),
              ),
              Positioned(
                bottom:  50,
                left: 150,
                child: Container(
                  width: 2,
                  height: 100,
                  color: Color.fromARGB(255, 81, 80, 80),
                ),
              ),
              Positioned(
                left: 170,
                bottom: 120,
                child: Text("Available On",style: GoogleFonts.montserrat(
                        fontSize: 15, fontWeight: FontWeight.w500)),
              ),
              Positioned(
                left: 170,
                bottom: 90,
                child: Text("Monday-Saturday",style: GoogleFonts.montserrat(
                        fontSize: 17, fontWeight: FontWeight.bold)),
              ),
              Positioned(
                bottom: 60,
                left: 170,
                child: Text("5.00 PM to 8.00 PM",style: GoogleFonts.montserrat(
                        fontSize: 17, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Professional Summary",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "Dr. Courtney Herry’s expertise includes comprehensive care for epilepsy, epilepsy surgery and electroencephalography advance reporting system. He is also a significant member of Indian Academy of Neurology.",
                    textAlign: TextAlign.justify,
                    overflow: TextOverflow.ellipsis,
                    maxLines: isSummaryExpanded ? null : 3,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isSummaryExpanded = !isSummaryExpanded;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      isSummaryExpanded ? "Read more" : "Read less",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>AppoinmentBookigScreen(),
              ));
            },
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    "Book Your Appointment",
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: size.width * 0.04,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              height: 55,
              width: 250,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 71, 153, 124),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}