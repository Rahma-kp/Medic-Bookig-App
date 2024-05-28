import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medic/controller/doctor_profile_provider.dart';
import 'package:medic/model/doctor_model.dart';
import 'package:medic/model/user_model.dart';
import 'package:medic/service/doctor_service.dart';
import 'package:medic/view/userside/appoinment/appoinment_screen.dart';
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
        backgroundColor: Color.fromARGB(255, 241, 240, 240),
        centerTitle: true,
        title: Text(
          'Doctor profile',
          style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
        ),
        actions: [IconButton(onPressed: (){
          NavigatorWidget().push(context, ChatPage(userInfo:UserModel(uId: widget.doctor.id,userName: widget.doctor.fullName),));
        }, icon: Icon(FeatherIcons.messageCircle,))],
      ),
      backgroundColor: Color.fromARGB(255, 241, 240, 240),
      body: SingleChildScrollView(
        child: Column(
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
                          Color.fromARGB(255, 123, 125, 125),
                          Color.fromARGB(255, 241, 239, 239),
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
                  left: 130,
                  top: 50,
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(widget.doctor.image!),
                      ),
                      Text(
                        "Dr.${widget.doctor.fullName!}",
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        widget.doctor.category!,
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
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
                  child: Text("₹${widget.doctor.fee}",
                      style: GoogleFonts.montserrat(
                          fontSize: 25, fontWeight: FontWeight.w700)),
                ),
                Positioned(
                  bottom: 50,
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
                  child: Text("Available On",
                      style: GoogleFonts.montserrat(
                          fontSize: 15, fontWeight: FontWeight.w500)),
                ),
                Positioned(
                  left: 170,
                  bottom: 90,
                  child: Text(widget.doctor.workingDays!,
                      style: GoogleFonts.montserrat(
                          fontSize: 17, fontWeight: FontWeight.bold)),
                ),
                Positioned(
                  bottom: 60,
                  left: 170,
                  child: Text(
                      "${widget.doctor.startTime} to ${widget.doctor.endTime}",
                      style: GoogleFonts.montserrat(
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
                  Consumer<DoctorProfileProvider>(
                    builder: (context, value, child) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.doctor.aboutDoctor!,
                            textAlign: TextAlign.justify,
                            overflow: TextOverflow.ellipsis,
                            maxLines: value.isSummaryExpanded ? 70: null,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Experience: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                    color: Colors
                                        .black, 
                                  ),
                                ),
                                TextSpan(
                                  text: '${widget.doctor.experience}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16.0,
                                    color: Colors
                                        .black, 
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
                            style: TextStyle(
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
                  builder: (context) => AppoinmentBookigScreen(),
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
      ),
    );
  }
}