import 'package:flutter/material.dart';
import 'package:medic/controller/carousel_controller.dart';
import 'package:medic/view/home/category_screen.dart';
import 'package:medic/view/home/notification_screen.dart';
import 'package:medic/view/home/widget/carousel_widget.dart';
import 'package:medic/view/home/widget/category_widget.dart';
import 'package:medic/view/home/widget/tope_doctors_listview.dart';
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
                DoctorsListView(size: size)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
