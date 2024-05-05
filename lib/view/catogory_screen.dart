import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medic/view/doctor_listing_screen.dart';
import 'package:medic/widget/imgae.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
              backgroundColor:  const Color.fromARGB(255, 231, 230, 227),
      ),
            backgroundColor:  const Color.fromARGB(255, 231, 230, 227), 
      body: Column(children: [Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.all(10),
                    itemCount:categoyImgaes.length,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 150,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => DoctorListScreen(),));},
                        child: Column(
                          children: [
                            Container(
                              height: 50,
                              width: 70,child: Image.asset(categoyImgaes[index],filterQuality: FilterQuality.high,fit: BoxFit.fill,),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 186, 184, 184),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            Text(nameCatory[index],style: GoogleFonts.montserrat(
                      color:  Colors.black,
                      fontSize: size.width * 0.04,
                      fontWeight: FontWeight.w600,
                    ),)
                          ],
                        ),
                      );
                    },
                  ),
                ),],)
    );
  }
}