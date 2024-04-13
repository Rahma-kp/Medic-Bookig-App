import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medic/view/notification_screen.dart';
import 'package:medic/widget/imgae.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => NotificationScreen(),
                ));
              },
              icon: Icon(Icons.notifications))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              items: imagesList.map((item) {
                return Container(
                  margin: EdgeInsets.all(5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Image.network(
                      item,
                      fit: BoxFit.cover,
                      width: 1000.0,
                    ),
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    current = index;
                  });
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Find Your Specailist",
                  style: GoogleFonts.montserrat(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                    onTap: () {},
                    child: Text(
                      "See All",
                      style: GoogleFonts.montserrat(
                          fontSize: 15,
                          color: const Color.fromARGB(255, 10, 40, 64),
                          fontWeight: FontWeight.bold),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
