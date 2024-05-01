import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:medic/controller/carousel_controller.dart';
import 'package:medic/view/catogory_screen.dart';
import 'package:medic/view/notification_screen.dart';
import 'package:medic/widget/home_widget.dart';
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
    double circleAvatarRadius = size.shortestSide * circleAvatarRadiusFraction;
    return Scaffold(
      appBar: AppBar(
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
      body: Consumer<HomeCaroselController>(
        builder: (context, value, child) => Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
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
              Padding(
                padding: EdgeInsets.all(size.width * 0.02),
                child: SmoothPageIndicator(
                  controller: PageController(),
                  count: imagesList.length,
                  effect: SlideEffect(),
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
                        fontSize: size.width * 0.05, fontWeight: FontWeight.bold),
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
              SizedBox(height: size.height * 0.02),
              homeCategory(context, size, circleAvatarRadius: circleAvatarRadius),
            
            ],
          ),
        ),
      ),
    );
  }
}
