import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(backgroundColor: Color.fromARGB(255, 38, 140, 101),
      body: Column(children: [Image.asset("assets/medic.png"),
      Text("Medic",style: TextStyle(color: Colors.white),)],),);
  }
}