import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeedBackScreen extends StatelessWidget {
  const FeedBackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(title: Text("Feed Back",style: TextStyle(color: Colors.white),),
        iconTheme: IconThemeData(color: Colors.white),
      backgroundColor:Color.fromARGB(255, 38, 140, 101),),);
  }
}