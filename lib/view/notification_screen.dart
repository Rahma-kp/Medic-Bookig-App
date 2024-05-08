import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
       backgroundColor:  const Color.fromARGB(255, 231, 230, 227),
    ),       backgroundColor:  const Color.fromARGB(255, 231, 230, 227),
 body: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return GestureDetector(onTap: (){
                        // Navigator.of(context).push(MaterialPageRoute(builder: (context) => DoctorProfile(),));
                        },
                        child: Card(color: Color.fromARGB(255, 255, 255, 255),
                          elevation: 3,
                          child: Row(
                            children: [
                             
                              Text(
                                "Dr. Ward Warren",
                                style: GoogleFonts.montserrat(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "neoghjkvbnm",
                                style: GoogleFonts.montserrat(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),  );
  }
}