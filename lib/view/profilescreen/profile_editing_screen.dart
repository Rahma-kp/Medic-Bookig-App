import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileEditingScreen extends StatelessWidget {
  const ProfileEditingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(appBar: AppBar(
      backgroundColor:Color.fromARGB(255, 38, 140, 101), ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            child: Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Edit Your Profile",style: GoogleFonts.montserrat(
                                fontSize: size.width * 0.05,
                                fontWeight: FontWeight.bold),),
                                
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Name", style: GoogleFonts.aBeeZee(
                              fontSize: size.width * 0.05,
                              fontWeight: FontWeight.bold),),
                        TextFormField(decoration: InputDecoration(hintText:" Enter your Name",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),),
                      ],
                    ),
                  ), Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Age", style: GoogleFonts.aBeeZee(
                              fontSize: size.width * 0.05,
                              fontWeight: FontWeight.bold),),
                        TextFormField(decoration: InputDecoration(hintText:" Enter your Age",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),),
                      ],
                    ),
                  ), Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Blood Group", style: GoogleFonts.aBeeZee(
                              fontSize: size.width * 0.05,
                              fontWeight: FontWeight.bold),),
                        TextFormField(decoration: InputDecoration(hintText:" Enter your Blood group",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),),
                      ],
                    ),
                  ), Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Height", style: GoogleFonts.aBeeZee(
                              fontSize: size.width * 0.05,
                              fontWeight: FontWeight.bold),),
                        TextFormField(decoration: InputDecoration(hintText:" Enter your Height",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),),
                      ],
                    ),
                  ), Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 20),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Weight", style: GoogleFonts.aBeeZee(
                              fontSize: size.width * 0.05,
                              fontWeight: FontWeight.bold),),
                        TextFormField(decoration: InputDecoration(hintText:" Enter your Weight",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),),
                      ],
                    ),
                  ),

                 GestureDetector(onTap: (){Navigator.of(context).pop();},
                    child: Container(height: 50,width: 200,child: Center(child: Text("Confirm",style: GoogleFonts.aBeeZee(
                      color:Colors.white,
                                fontSize: size.width * 0.05,
                                fontWeight: FontWeight.bold))),
                      decoration: BoxDecoration(color:Color.fromARGB(255, 38, 140, 101),
                        borderRadius: BorderRadius.circular(15)),),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
