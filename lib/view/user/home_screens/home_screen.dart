import 'package:flutter/material.dart';
import 'package:medic/controller/carousel_controller.dart';
import 'package:medic/view/user/home_screens/catogory_screen.dart';
import 'package:medic/view/user/doctor_listing_screen.dart';
import 'package:medic/view/user/home_screens/notification_screen.dart';
import 'package:medic/view/user/home_screens/widget/carousel_widget.dart';
import 'package:medic/view/user/home_screens/widget/tope_doctors_listview.dart';
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
                DoctorsListView(size: size)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
