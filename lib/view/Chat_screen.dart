import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color.fromARGB(255, 229, 224, 224),
      appBar: AppBar(backgroundColor:  Color.fromARGB(255, 228, 226, 226),
        title: Text(
          "Chats",
          style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextFormField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                prefixIcon: Icon(Icons.search),
                hintText: "Search for Doctors",
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                        color:Colors.white,
                        border: Border.all(color: Colors.white, width: 0.2),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 39, 39, 39).withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: ListTile(
                        leading: CircleAvatar(
                            backgroundImage: AssetImage("assets/doct.jpeg"),
                            radius: 50),
                        title: Text(
                          "Dr. Ward Warren",
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle:
                            Text("Hai, i am inform your health condition"),
                            
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
