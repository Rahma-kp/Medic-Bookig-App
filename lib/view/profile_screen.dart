import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medic/view/setting_screen.dart';
import 'package:medic/widget/profile_details_container.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String selectedItem = "Settings"; 

  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Color.fromARGB(255, 210, 209, 209),
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
            height: 500,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 142, 139, 139).withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
              color: Color.fromARGB(255, 38, 140, 101),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
          ),
          Positioned(
            top: 280,
            left: 130,
            child: Column(
              children: [
                Text(
                  "RAHMA",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "9061559381",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            right: 0,
            top: 30,
            child: PopupMenuButton<String>(
              initialValue: selectedItem,
              onSelected: (String value) {
                setState(() {
                  selectedItem = value;
                  if(value=="Settings"){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SettingScreen(),));
                  }
                });
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'Settings',
                  child: Text('Settings',style: GoogleFonts.montserrat(color:Colors.white,
                        fontSize: size.width * 0.04, fontWeight: FontWeight.w600)),
                ),
              ],
              icon: Icon(Icons.more_vert_outlined, color: Colors.white),
            ),
          ),

          Positioned(
            top: 120,
            left: 120,
            child: CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage("assets/profile.jpeg"),
            ),
          ),

          DetailsBox(
            clr1: Colors.black,
            clr2: Colors.black,
            text1: "Age",
            text2: "21",
            left: 30,
            top: 360,
            clr: Colors.white,
          ),
          DetailsBox(
            text1: "Height",
            text2: "163",
            top: 360,
            left: 215,
            clr: Color.fromARGB(255, 28, 113, 76),
            clr1: Colors.white,
            clr2: Colors.white,
          ),
          DetailsBox(
            text1: "Weight",
            text2: "50",
            top: 480,
            left: 30,
            clr: Color.fromARGB(255, 28, 113, 76),
            clr1: Colors.white,
            clr2: Colors.white,
          ),
          DetailsBox(
            text1: "Blood Group",
            text2: "B+",
            top: 480,
            left: 215,
            clr: Colors.white,
            clr1: Colors.black,
            clr2: Colors.black,
          ),
        ],
      ),
    );
  }
}
