import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:Color.fromARGB(255, 229, 224, 224),
      appBar: AppBar(iconTheme: IconThemeData(color: Colors.white),
      actions: [IconButton(onPressed: (){}, icon: Icon(Icons.call))],
        backgroundColor:Color.fromARGB(255, 38, 140, 101) ,
        title: Text(
          "Dr.Ward Warren",
          style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: size.width * 0.04,
              fontWeight: FontWeight.w600),
        ),
      ),
      floatingActionButton: CircleAvatar(backgroundColor: Color.fromARGB(255, 38, 140, 101),
        child: IconButton(onPressed: (){}, icon: Icon(Icons.send,color: Colors.white,)))
    );
  }
}
