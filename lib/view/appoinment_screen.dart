import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppoinmentScreen extends StatefulWidget {
  const AppoinmentScreen({Key? key});

  @override
  State<AppoinmentScreen> createState() => _AppoinmentScreenState();
}

class _AppoinmentScreenState extends State<AppoinmentScreen> {
   
   int selectedindex = -1; // Initialize selectedindex to -1

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chats",
          style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, bottom: 10, top: 20),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedindex = index; // Assign index to selectedindex
                      });
                    },
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          color: selectedindex == index ?Color.fromARGB(255, 33, 186, 127) : Colors.white,
                          border: Border.all(color: Colors.grey, width: 0.2),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: ListTile(
                          leading: Container(
                            height: 100,
                            width: 70,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 152, 228, 154),
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(child: Text("19 march",style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              color:selectedindex==index?Colors.white:Colors.black),)),
                          ),
                          title: Text(
                            "Dr. Ward Warren",
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.bold,
                                color: selectedindex == index ? Colors.white : Colors.black), // Change text color based on selectedindex
                          ),
                          subtitle: Text("Neuro Medicine",style: GoogleFonts.montserrat(color:selectedindex==index?Colors.white:Colors.black),),
                        ),
                      ),
                    ),
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
