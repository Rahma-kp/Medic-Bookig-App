
  import 'package:flutter/material.dart';
import 'package:medic/service/authentication_service.dart';
import 'package:medic/view/authenications/login_screen.dart';

void showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Logout"),
          content: Text("Do you want to logout?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("No",style: TextStyle(color: Colors.green,fontSize: 15),),
            ),
            TextButton(
              onPressed: () {
                AuthService().signOutEmail();
                   Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                          (Route<dynamic> route) => false,
                        );
              },
              child: Text("Yes",style: TextStyle(color: Colors.red,fontSize: 15),),
            ),
          ],
        );
      },
    );
  }
