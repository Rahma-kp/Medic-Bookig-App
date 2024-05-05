import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TermsConditionScreen extends StatelessWidget {
  const TermsConditionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("Terms & Vonditions",style: TextStyle(color: Colors.white),),
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: Color.fromARGB(255, 38, 140, 101),),);
  }
}