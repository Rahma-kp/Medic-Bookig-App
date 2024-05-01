import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(appBar: AppBar(),
      body: Column(mainAxisAlignment: MainAxisAlignment.start,
        children: [SizedBox(width: 20,),
          Padding(
            padding: const EdgeInsets.only(top: 10,left: 20),
            child: Text('Settings',
                style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: size.width * 0.06,
                    fontWeight: FontWeight.w600)),
          ),
          Stack(children: [Container(height: 400,width: 300,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.black),)],)
        ],
      ),
    );
  }
}
