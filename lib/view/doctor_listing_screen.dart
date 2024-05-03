import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DoctorListScreen extends StatelessWidget {
  const DoctorListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 230, 227),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:50,left: 20,right: 20),
            child: TextFormField(
              decoration: InputDecoration(prefixIcon: Icon(Icons.search),
                hintText: "Search for doctors",
                filled: true,
                 fillColor: Color.fromARGB(255, 193, 190, 190),
                  border: OutlineInputBorder(borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20))),
            ),
          ), Expanded(
            child: ListView.builder(
              itemCount: 8,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: Card(elevation: 10,
                      color: Color.fromARGB(255, 203, 201, 201),
                      child: Row(children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: CircleAvatar(
                            backgroundImage: AssetImage("assets/doct1.jpeg"),
                          radius:40),
                      ),
                      SizedBox(width: 10,),
                        Column(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           Text(
                        "Dr. Ward Warren",
                        style: GoogleFonts.montserrat(fontSize:20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text("neoghjkvbnm",
                        style: GoogleFonts.montserrat(fontSize:15,
                            fontWeight: FontWeight.w700),),
                        ],)
                    ],),)
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
