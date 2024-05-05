import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medic/view/appoinment_screen.dart';

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
      appBar: AppBar( backgroundColor:const Color.fromARGB(255, 231, 230, 227),
        centerTitle: true,
        title: Text(
          'Doctor profile',
          style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 231, 230, 227),
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
                        Color.fromARGB(255, 154, 156, 154),
                        Color.fromARGB(255, 108, 138, 126)
                      ],
                    ),
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  height: 300,
                  width: 400,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 29, 141, 102),
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
                left: 140,
                top: 180,
                child: ProfileText(size, "Dr. Courtney Herry"),
              ),
              Positioned(
                left: 150,
                top: 210,
                child: ProfileText(size, "Neuro Medicine"),
              ),
              Positioned(
                left: 60,
                bottom: 120,
                child: Text("Fee"),
              ),
              Positioned(
                left: 60,
                bottom: 80,
                child: Text("20"),
              ),
              Positioned(
                left: 190,
                bottom: 120,
                child: Text("Available On"),
              ),
              Positioned(
                left: 190,
                bottom: 90,
                child: Text("Monday-Saturday"),
              ),
              Positioned(
                bottom: 60,
                left: 190,
                child: Text("5.00 PM to 8.00 PM"),
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
          GestureDetector(onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) =>AppoinmentScreen() ,));},
            child: Container(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Text("Book Your Appoinment",style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: size.width * 0.04,
                      fontWeight: FontWeight.w600,
                    ),)),
            ),
              height: 55,width: 250,
              decoration:BoxDecoration(color: Color.fromARGB(255, 29, 141, 102),
                borderRadius: BorderRadius.circular(10)),),
          )
        ],
      ),
    );
  }

  Widget ProfileText(Size size, String text) {
    return Text(
      text,
      style: GoogleFonts.montserrat(
        color: Colors.white,
        fontSize: size.width * 0.04,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
