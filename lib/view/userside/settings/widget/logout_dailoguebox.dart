
import 'package:flutter/material.dart';
import 'package:medic/controller/authentication_provider.dart';
import 'package:medic/view/userside/authentication/login_screen.dart';
import 'package:medic/widget/navigation.dart';
import 'package:provider/provider.dart';

void showLogoutDialog(BuildContext context) {
   final getProvider=Provider.of<AuthenticationProvider>(context, listen: false);
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Logout"),
        content: const Text("Do you want to logout?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "No",
              style: TextStyle(color: Colors.green, fontSize: 15),
            ),
          ),     
          TextButton(
            onPressed: () {
              getProvider.signOutWithEmail();
              getProvider.googleSignOut();
              getProvider.onTabTapped(0);
              NavigatorWidget().pushRemoveUntil(context, const LoginScreen());
            },
            child: const Text(
              "Yes",
              style: TextStyle(color: Colors.red, fontSize: 15),
            ),
          ),
        ],
      );
    },
  );
}
