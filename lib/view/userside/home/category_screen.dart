import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medic/view/userside/appoinment/doctor_listing_screen.dart';
import 'package:medic/widget/imgae.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories', style: GoogleFonts.montserrat(color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 29, 141, 102),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      backgroundColor: const Color.fromARGB(255, 231, 230, 227),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: categoryImgaes.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DoctorListScreen(
                    category: categoryName[index],
                  ),
                ));
              },
            child: Card(color: const Color.fromARGB(255, 206, 205, 205),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 5,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black, width: 1),
                      ),
                      height: 70,
                      width: 70,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          categoryImgaes[index],
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Text(
                        categoryName[index],
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios, color: Colors.grey),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
