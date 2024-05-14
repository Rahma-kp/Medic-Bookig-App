import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medic/controller/carousel_controller.dart';
import 'package:medic/view/home_screens/catogory_screen.dart';
import 'package:medic/view/doctor_listing_screen.dart';
import 'package:medic/view/doctor_profile_screen.dart';
import 'package:medic/view/home_screens/notification_screen.dart';
import 'package:medic/widget/imgae.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Hai,Rahma"),
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
                CarouselSlider(
                  items: imagesList.map((item) {
                    return Container(
                      margin: EdgeInsets.all(size.width * 0.00),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        child: Image.asset(
                          item,
                          fit: BoxFit.cover,
                          width: size.width * 0.9,
                          height: size.height * 0.3,
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
                        padding: EdgeInsets.all(size.width * 0.02),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DoctorListScreen(),
                            ));
                          },
                          child: Column(
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black,width: 1),
                                  ),
                                  height: 70,
                                  width: 70,
                                  child: Image.asset(
                                    categoryImgaes[index],
                                    filterQuality: FilterQuality.high,
                                    fit: BoxFit.fill,
                                  )),
                              SizedBox(
                                height: 8,
                              ),
                              Text(categoryName[index],  style: GoogleFonts.montserrat(
                                           fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),)
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(size.width * 0.02),
                  child: Text(
                    "Top Rated Doctors",
                    style: GoogleFonts.montserrat(
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 5, top: 5),
                  height: size.height * 0.6,
                  child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 5, right: 5, bottom: 5, top: 5),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => DoctorProfile(),));
                          },
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border:
                                  Border.all(color: Colors.black, width: 0.5),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child:Stack(children: [ Positioned(top: 10,left: 10,
                              child: CircleAvatar(
                                      radius: 40,
                                      backgroundImage:
                                          AssetImage("assets/doct1.jpeg"),
                                    ),
                            ),
                                    Positioned(top: 15,left:110,
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
                                      Positioned(top: 40,left: 110,
                                        child: Text(
                                        "Neuro Medicine",
                                        style: GoogleFonts.montserrat(
                                           fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                                                            ),
                                      ),
                                     Positioned(bottom: 5,right: 10,
                                       child: Text(
                                        "05.00 pm to 10.30 pm",
                                        style: GoogleFonts.montserrat(
                                          color: Colors.black,
                                        ),
                                                                           ),
                                     )
                                  ],),
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
