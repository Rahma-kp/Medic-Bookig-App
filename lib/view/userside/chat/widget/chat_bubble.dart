import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final bool isSent;
  final String message;
  final String time;
  final String type;

  const ChatBubble({
    super.key,
    required this.isSent,
    required this.message,
    required this.time,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.width * 0.03,
        top: MediaQuery.of(context).size.width * 0.03,
        left: isSent
            ? MediaQuery.of(context).size.width * 0.15
            : MediaQuery.of(context).size.width * 0.03,
        right: isSent
            ? MediaQuery.of(context).size.width * 0.03
            : MediaQuery.of(context).size.width * 0.15,
      ),
      child: Align(
        alignment: isSent ? Alignment.centerRight : Alignment.centerLeft,
        child: GestureDetector(
          onTap: () {
            if (type == 'image') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Scaffold(
                    appBar: AppBar(),
                    body: Center(
                      child: Image.network(
                        message, 
                      ),
                    ),
                  ),
                ),
              );
            }
          },
          child: Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
            decoration: BoxDecoration(
              color: isSent
                  ? const Color.fromARGB(255, 29, 141, 102)
                  : const Color.fromARGB(255, 110, 111, 110),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                    MediaQuery.of(context).size.width * 0.045),
                topRight: Radius.circular(
                    MediaQuery.of(context).size.width * 0.045),
                bottomLeft: isSent
                    ? Radius.circular(
                        MediaQuery.of(context).size.width * 0.045)
                    : Radius.circular(
                        MediaQuery.of(context).size.width * 0.01),
                bottomRight: isSent
                    ? Radius.circular(
                        MediaQuery.of(context).size.width * 0.01)
                    : Radius.circular(
                        MediaQuery.of(context).size.width * 0.045),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Check if the message is an image
                if (type == 'image')
                  Image.network(
                    message, // Assuming the message contains the image URL
                    width: 200, // Adjust the width as needed
                    height: 200, // Adjust the height as needed
                  ),
 
                if (type == 'text')
                  Text(
                    message,
                    style: TextStyle(
                      color: isSent ? Colors.white : Colors.black,
                    ),
                  ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.02,
                ),
                // Display time
                Text(
                  time,
                  style: TextStyle(
                    color: isSent ? Colors.white : Colors.black,
                    fontSize: 10,
                  ),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
