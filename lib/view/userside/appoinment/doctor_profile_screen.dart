import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medic/controller/doctor_profile_provider.dart';
import 'package:medic/model/doctor_model.dart';
import 'package:medic/service/doctor_service.dart';
import 'package:medic/view/userside/appoinment/appoinment_screen.dart';
import 'package:medic/view/userside/appoinment/widget/doctor_profile_container.dart';
import 'package:medic/view/userside/chat/chat_screen.dart';

import 'package:medic/widget/navigation.dart';
import 'package:provider/provider.dart';

class DoctorProfile extends StatefulWidget {
  const DoctorProfile({Key? key, required this.doctor}) : super(key: key);

  final DoctorModel doctor;

  @override
  State<DoctorProfile> createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  late final DoctorService doctorService;

  @override
  void initState() {
    super.initState();
    doctorService = DoctorService();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 241, 240, 240),
        centerTitle: true,
        title: Text(
          'profile',
          style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                NavigatorWidget().push(
                    context,
                    ChatPage(
                      userInfo: DoctorModel(
                          id: widget.doctor.id,
                          fullName: widget.doctor.fullName),
                    ));
              },
              icon: const Icon(
                FeatherIcons.messageCircle,
              ))
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 241, 240, 240),
      body: SingleChildScrollView(
        child: Column(
          children: [
            profileContainer(widget: widget),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Professional Summary",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Consumer<DoctorProfileProvider>(
                    builder: (context, value, child) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.doctor.aboutDoctor!,
                            textAlign: TextAlign.justify,
                            overflow: TextOverflow.ellipsis,
                            maxLines: value.isSummaryExpanded ? 70 : null,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                const TextSpan(
                                  text: 'Experience: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: '${widget.doctor.experience}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Consumer<DoctorProfileProvider>(
                    builder: (context, value, child) => InkWell(
                      onTap: () {
                        value.isExpaned();
                      },
                      child: Consumer<DoctorProfileProvider>(
                        builder: (context, value, child) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            value.isSummaryExpanded ? "Read less" : "Read more",
                            style: const TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
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
                  builder: (context) =>
                     AppoinmentBookingScreen(doctor: widget.doctor),
                ));
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Container(
                  height: 55,
                  width: 250,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 71, 153, 124),
                    borderRadius: BorderRadius.circular(20),
                  ),
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
