import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.call),
          )
        ],
        backgroundColor: Color.fromARGB(255, 71, 153, 124),
        title: Text(
          "Dr. Ward Warren",
          style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: size.width * 0.04,
              fontWeight: FontWeight.w600),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 241, 240, 240),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                reverse: true, 
                children: [
                  _buildChatMessage(
                    "Hello, Dr. Warren!",
                    isSentByMe: false,
                  ),
                  _buildChatMessage(
                    "Hi! How can I help you today?",
                    isSentByMe: true,
                  ),
                  
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Type your message...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  FloatingActionButton(
                    backgroundColor: Color.fromARGB(255, 71, 153, 124),
                    onPressed: () {},
                    child: Icon(Icons.send, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChatMessage(String message, {required bool isSentByMe}) {
    return Align(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(
          color: isSentByMe ?Color.fromARGB(255, 71, 153, 124) : Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(
          message,
          style: TextStyle(color: isSentByMe ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
