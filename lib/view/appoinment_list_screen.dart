import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medic/view/doctor_listing_screen.dart';
import 'package:medic/widget/notification_tab.dart';

class AppoinmentListScreen extends StatefulWidget {
  const AppoinmentListScreen({Key? key});

  @override
  State<AppoinmentListScreen> createState() => _AppoinmentListScreenState();
}

class _AppoinmentListScreenState extends State<AppoinmentListScreen> {
  int selectedindex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 235, 235),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 238, 235, 235),
        title: Text(
          "My Appointments",
          style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => DoctorListScreen(),));
          }, icon: Icon(Icons.add_circle_outline))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomTabBar(), 
            Container(
              height: 700,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, bottom: 10, top: 20),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedindex = index;
                        });
                      },
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: selectedindex == index
                              ? Color.fromARGB(255, 33, 186, 127)
                              : Colors.white,
                          border:
                              Border.all(color: Colors.grey, width: 0.2),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ListTile(
                          leading: Container(
                            height: 100,
                            width: 70,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 81, 157, 81),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                "19 march",
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold,
                                  color: selectedindex == index
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                          title: Column(
                            children: [
                              Text(
                                "Dr. Ward Warren",
                                style: GoogleFonts.montserrat(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: selectedindex == index
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                "Neuro Medicine",
                                style: GoogleFonts.montserrat(
                                  color: selectedindex == index
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                "10.00 TO 10.30",
                                style: GoogleFonts.montserrat(
                                  color: selectedindex == index
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              )
                            ],
                          ),
                        ),
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
