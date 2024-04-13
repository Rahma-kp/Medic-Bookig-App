// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:medic/controller/carousel_controller.dart';
// import 'package:medic/view/notification_screen.dart';
// import 'package:medic/widget/imgae.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
// class _HomeScreenState extends State<HomeScreen> {
//   final CarouselController _carouselController = CarouselController(); // Define CarouselController

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           IconButton(
//             onPressed: () {
//               Navigator.of(context).push(MaterialPageRoute(
//                 builder: (context) => NotificationScreen(),
//               ));
//             },
//             icon: Icon(Icons.notifications),
//           )
//         ],
//       ),
//       body: Consumer<HomeCaroselController>(
//         builder: (context, value, child) => Padding(
//           padding: const EdgeInsets.only(left: 10, right: 10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               CarouselSlider(
//                 carouselController: _carouselController, 
//                 items: imagesList.map((item) {
//                   return Container(
//                     margin: EdgeInsets.all(5.0),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.all(Radius.circular(10)),
//                       child: Image.asset(
//                         item,
//                         fit: BoxFit.cover,
//                         width: 1000.0,
//                       ),
//                     ),
//                   );
//                 }).toList(),
//                 options: CarouselOptions(
//                   autoPlay: true,
//                   enlargeCenterPage: true,
//                   aspectRatio: 2.0,
//                   onPageChanged: (index, reason) {
//                     value.carouselChange(index);
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(8),
//                 child: SmoothPageIndicator(
//                   controller: _carouselController, // Use CarouselController
//                   count: imagesList.length, // Number of pages
//                   effect: WormEffect(), // Choose the indicator effect
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Find Your Specialist",
//                     style: GoogleFonts.montserrat(
//                         fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   GestureDetector(
//                     onTap: () {},
//                     child: Text(
//                       "See All",
//                       style: GoogleFonts.montserrat(
//                           fontSize: 15,
//                           color: const Color.fromARGB(255, 10, 40, 64),
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
