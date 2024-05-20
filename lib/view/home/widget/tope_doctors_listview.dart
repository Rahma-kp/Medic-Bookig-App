import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medic/model/doctor_model.dart';
import 'package:medic/view/appoinment/doctor_profile_screen.dart';

class DoctorsListView extends StatelessWidget {
  const DoctorsListView({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5, top: 5),
      height: size.height * 0.6,
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                const EdgeInsets.only(left: 5, right: 5, bottom: 5, top: 5),
            child: GestureDetector(
              onTap: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => DoctorProfile(doctor:DoctorModel(fullName: , age: age, gender: gender, category: category, position: position, workingDays: workingDays, startTime: startTime, endTime: endTime) ,),
                //   ),
                // );
              },
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 10,
                      left: 10,
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage("assets/doct1.jpeg"),
                      ),
                    ),
                    Positioned(
                      top: 15,
                      left: 110,
                      child: Text(
                        "Dr. Ward Warren",
                        style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 40,
                      left: 110,
                      child: Text(
                        "Neuro Medicine",
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      right: 10,
                      child: Text(
                        "05.00 pm to 10.30 pm",
                        style: GoogleFonts.montserrat(
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
