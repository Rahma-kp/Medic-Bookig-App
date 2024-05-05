import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medic/controller/carousel_controller.dart';
import 'package:medic/view/catogory_screen.dart';
import 'package:medic/view/doctor_listing_screen.dart';
import 'package:medic/view/doctor_profile_screen.dart';
import 'package:medic/view/notification_screen.dart';
import 'package:medic/widget/imgae.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

const double circleAvatarRadiusFraction = 0.085;

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(backgroundColor:  const Color.fromARGB(255, 231, 230, 227),
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
      backgroundColor:  const Color.fromARGB(255, 231, 230, 227),
      body: Consumer<HomeCaroselController>(
        builder: (context, value, child) => Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CarouselSlider(
                  items: imagesList.map((item) {
                    return Container(
                      margin: EdgeInsets.all(size.width * 0.02),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Image.asset(
                          item,
                          fit: BoxFit.cover,
                          width: size.width * 0.9,
                        ),
                      ),
                    );
                  }).toList(),
                  options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 2.0,
                    onPageChanged: (index, reason) {
                      value.carouselChange(index);
                    },
                  ),
                ),
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
                Container(
                  margin: const EdgeInsets.only(bottom: 5, top: 5),
                  height: size.height * 0.15,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(5),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DoctorListScreen(),
                            ));
                          },
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundImage:
                                    AssetImage("assets/carogry.jpeg"),
                              ),
                              Text("ALL")
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Top Rated Doctors",style: GoogleFonts.montserrat(
                          fontSize: size.width * 0.05,
                          fontWeight: FontWeight.bold), ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 5, top: 5),
                  height: size.height * 0.60,
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return GestureDetector(onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => DoctorProfile(),));},
                        child: Card(color: Color.fromARGB(255, 255, 255, 255),
                          elevation: 3,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: CircleAvatar(
                                  radius: 35,
                                  backgroundImage: AssetImage("assets/doct.jpeg"),
                                ),
                              ),
                              Column(
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
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
