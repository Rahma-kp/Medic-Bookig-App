import 'package:flutter/material.dart';
import 'package:medic/widget/text_widget.dart';


class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar( title:poppinsHeadText(
            text: 'Notifications',
            fontSize: 20,
          ),
       backgroundColor:  const Color.fromARGB(255, 231, 230, 227),
    ),       backgroundColor:  const Color.fromARGB(255, 231, 230, 227),
 body:ListView.builder(
        itemCount: 10, 
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 122, 182, 159),
              child: Icon(
                Icons.notifications,
                color: Colors.white,
              ),
            ),
            title: Text('Notification Title $index'),
            subtitle: Text('Notification message goes here'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
             
            },
          );
        },
      ),
    );
  }
}