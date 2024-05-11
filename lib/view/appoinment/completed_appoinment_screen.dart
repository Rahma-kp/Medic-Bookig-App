import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CompletedAppointments extends StatefulWidget {
  const CompletedAppointments({Key? key});

  @override
  State<CompletedAppointments> createState() => _CompletedAppointmentsState();
}

class _CompletedAppointmentsState extends State<CompletedAppointments> {
  int selectedindex = -1;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 235, 235),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 700,
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, bottom: 10, top: 10),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedindex = index;
                        });
                      },
                      child: Container(
                        height: 110,
                        decoration: BoxDecoration(
                          color: selectedindex == index
                              ?Color.fromARGB(255, 71, 153, 124)
                              : Color.fromARGB(255, 208, 192, 192),
                          border: Border.all(color: Colors.grey, width: 0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(children: [
                          Positioned(
                            left: 15,
                            top: 10,
                            child: Container(
                              height: 90,
                              width: 80,
                              decoration: BoxDecoration(
                                  color: selectedindex == index
                                      ? Color.fromARGB(255, 122, 182, 159)
                                      : Color.fromARGB(66, 219, 216, 216),
                                  borderRadius: BorderRadius.circular(30)),
                              child: Center(
                                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "19",
                                      style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.bold,
                                        fontSize:20,
                                        color: selectedindex == index
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                    Text(
                                      "March",
                                      style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.bold,
                                        color: selectedindex == index
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 120,
                            top: 20,
                            child: Text(
                              "Dr. Ward Warren",
                              style: GoogleFonts.montserrat(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: selectedindex == index
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 120,
                            top: 50,
                            child: Text(
                              "Neuro Medicine",
                              style: GoogleFonts.montserrat(
                                fontSize: 16,
                                color: selectedindex == index
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                          Positioned(
                            left:120,
                            bottom:15,
                            child: Text(
                              "08.00 pm to 10.30pm",
                              style: GoogleFonts.montserrat(
                                color: selectedindex == index
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
