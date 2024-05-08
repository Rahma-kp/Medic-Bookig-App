

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medic/view/appoinment/canceld_appinments.dart';
import 'package:medic/view/appoinment/upcoming_appoinment_screen.dart';
import 'package:medic/widget/text_widget.dart';

import 'completed_appoinment_screen.dart';


class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(centerTitle: true,
          backgroundColor: const Color(0xFFFFFFFF),
          title: poppinsHeadText(
            text: 'My Appointment',
            fontSize: 20,
          ),
          bottom: TabBar(
              labelColor:Color.fromARGB(255, 38, 140, 101),
              unselectedLabelColor: const Color(0xFF778293),
              labelStyle: GoogleFonts.poppins(
                fontSize: 14,
                color: const Color(0xffc778293),
              ),
              indicatorColor: Color.fromARGB(255, 38, 140, 101),
              indicatorWeight: 3,
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
              ]),
        ),
        body: const TabBarView(
          children: [
            UpcomingAppointments(),
            CompletedAppointments(),
            CancelledAppointments()
          ],
        ),
      ),
    );
  }
}