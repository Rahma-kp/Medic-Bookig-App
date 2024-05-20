
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medic/view/appoinment/doctor_listing_screen.dart';
import 'package:medic/widget/imgae.dart';

class catgoryWidget extends StatelessWidget {
  const catgoryWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5, top: 5),
      height: size.height * 0.15,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryName.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(size.width * 0.02),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DoctorListScreen(
                    category: categoryName[index],
                  ),
                ));
              },
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: Colors.black, width: 1),
                    ),
                    height: 70,
                    width: 70,
                    child: Image.asset(
                      categoryImgaes[index],
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    categoryName[index],
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
