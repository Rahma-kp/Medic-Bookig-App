import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medic/view/user/appoinment/canceld_appinments.dart';
import 'package:medic/view/user/appoinment/upcoming_appoinment_screen.dart';
import 'package:medic/view/user/doctor_listing_screen.dart';
import 'package:medic/widget/text_widget.dart';
import 'completed_appoinment_screen.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
         backgroundColor: Color.fromARGB(255, 241, 240, 240),
          title: poppinsHeadText(
            text: 'My Appointment',
            fontSize: 20,
          ),
          actions: [IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => DoctorListScreen(),));
          }, icon: Icon(Icons.add_circle_outline))],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Color.fromARGB(255, 172, 170, 170),
                ),
                child: TabBar(
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  labelStyle: GoogleFonts.montserrat(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Color.fromARGB(255, 71, 153, 124),
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: const [
                    Tab(
                      text: 'Upcoming',
                    ),
                    Tab(
                      text: 'Completed',
                    ),
                    Tab(
                      text: 'Cancelled',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            UpcomingAppointments(),
            CompletedAppointments(),
            CancelledAppointments(),
          ],
        ),
      ),
    );
  }
}
