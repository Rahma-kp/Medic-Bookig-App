import 'package:flutter/material.dart';
import 'package:medic/controller/carousel_controller.dart';
import 'package:medic/controller/doctor_provider.dart';
import 'package:medic/model/doctor_model.dart';
import 'package:medic/view/userside/home/category_screen.dart';
import 'package:medic/view/userside/home/notification_screen.dart';
import 'package:medic/view/userside/home/widget/carousel_widget.dart';
import 'package:medic/view/userside/home/widget/category_widget.dart';
import 'package:medic/view/userside/home/widget/tope_doctors_listview.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<DoctorModel>> _doctorsFuture;
  late String userId;

  @override
  void initState() {
    super.initState();
    final getprovider = Provider.of<DoctorController>(context, listen: false);
    _doctorsFuture = getprovider.getAllDoctors();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Hai, Rahma"),
        backgroundColor: Color.fromARGB(255, 241, 240, 240),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => NotificationScreen(),
              ));
            },
            icon: Icon(Icons.notifications),
          )
        ],
      ),
      backgroundColor: Color.fromARGB(255, 241, 240, 240),
      body: Consumer<HomeCaroselController>(
        builder: (context, value, child) => Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                homeCarouselSlider(size: size),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Find Your Specialist",
                      style: GoogleFonts.montserrat(
                          fontSize: size.width * 0.05,
                          fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CategoryScreen(),
                        ));
                      },
                      child: Text(
                        "See All",
                        style: GoogleFonts.montserrat(
                            fontSize: size.width * 0.04,
                            color: Color.fromARGB(255, 84, 118, 145),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                // category list view calling
                catgoryWidget(size: size),
                Padding(
                  padding: EdgeInsets.all(size.width * 0.02),
                  child: Text(
                    "Top Rated Doctors",
                    style: GoogleFonts.montserrat(
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.bold),
                  ),
                ),

                // ------- top rated doctors---
                FutureBuilder<List<DoctorModel>>(
                  future: _doctorsFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text("Error: ${snapshot.error}"));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(child: Text("No doctors available"));
                    } else {
                      return DoctorsListView(
                          size: size, doctor: snapshot.data!);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
