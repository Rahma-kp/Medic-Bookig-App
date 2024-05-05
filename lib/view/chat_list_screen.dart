import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medic/view/chat_screen.dart';

class ChatListingScreen extends StatelessWidget {
  const ChatListingScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 229, 224, 224),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 228, 226, 226),
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
          SizedBox(height: 20,),
          Expanded(
            child: ListView.builder(
              itemCount: 8,
              itemBuilder: (context, index) {
                return Center(
                  child: GestureDetector(onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChatScreen(),));},
                    child: Card(color:const Color.fromARGB(255, 179, 176, 176),
                      elevation:6,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: CircleAvatar(
                                backgroundImage: AssetImage("assets/doct.jpeg"),
                                radius: 40),
                          ),
                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Dr. Ward Warren",
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.bold,
                                    fontSize: size.width * 0.04,),
                              ),
                              Text("Hai, i am inform your health condition",style: TextStyle(overflow:TextOverflow.fade),),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(child: Text("1",style: TextStyle(color: Colors.white),),
                              backgroundColor: Color.fromARGB(255, 45, 185, 99),radius: 13,),
                          )
                        ],
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
