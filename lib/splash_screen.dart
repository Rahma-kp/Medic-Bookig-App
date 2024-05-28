import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medic/controller/authentication_provider.dart';
import 'package:medic/view/doctorside/wiget/bottom_bar.dart';
import 'package:medic/view/userside/authentication/login_screen.dart';
import 'package:medic/widget/bottom_bar.dart';
import 'package:medic/widget/navigation.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
      goToLogin(context);
    super.initState();
  
  }
  @override
 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 38, 140, 101),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/medic.png",
            color: const Color.fromARGB(197, 221, 220, 220),
          ),
          const SizedBox(height: 20),
          Text(
            "Medic",
            style: GoogleFonts.montserrat(
              fontSize: 40,
              fontStyle: FontStyle.italic,
              color: const Color.fromARGB(197, 221, 220, 220),
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  

  }

  
}
goToLogin(context) async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    final UserPrvd =
        Provider.of<AuthenticationProvider>(context, listen: false);

    if (currentUser == null) {
      await Future.delayed(
        Duration(seconds: 2),
      );
      return NavigatorWidget().pushReplacement(context,LoginScreen(),);
    } else {
      CircularProgressIndicator();
      await UserPrvd.getUser();
      await Future.delayed(
        Duration(seconds: 2),
      );
      // return NavigatorWidget().pushReplacement(context,BottomNavigation(selectedIndex: 0),);   
      return NavigatorWidget().pushReplacement(context, BottomDoctorNavigation(selectedIndex: 0),);
      
    }
  }
