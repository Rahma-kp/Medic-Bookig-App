
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medic/view/userside/appoinment/doctor_listing_screen.dart';
import 'package:medic/widget/imgae.dart';
class catgoryWidget extends StatelessWidget {
  const catgoryWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5, top: 5),
      height: size.height * 0.18,
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
              child: Column( mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(borderRadius:  BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.black, width: 1),
                    ),
                    height: 80,
                    width: 80,
                    child: ClipRRect(borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        categoryImgaes[index],
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.fill,
                      ),
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
