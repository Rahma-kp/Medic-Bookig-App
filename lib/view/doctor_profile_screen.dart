import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DoctorProfile extends StatelessWidget {
  const DoctorProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Doctor profile',
          style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(child: Container(height: 300,width: 400,decoration: BoxDecoration(
        color: Color.fromARGB(255, 30, 138, 97),
        borderRadius: BorderRadius.circular(10)),),),
    );
  }
}
