import 'package:flutter/material.dart';
import 'package:medic/controller/bottom_bar-provider.dart';
import 'package:medic/controller/carousel_controller.dart';
import 'package:medic/view/authenications/login_screen.dart';
import 'package:medic/view/doctor_listing_screen.dart';
import 'package:medic/view/doctor_profile_screen.dart';
import 'package:medic/widget/bottom_bar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => HomeCaroselController(),),
          ChangeNotifierProvider(
            create: (context) => BottomBarProvider(),
          )
        ],
        child: MaterialApp(
          theme: ThemeData(
            popupMenuTheme: PopupMenuThemeData(color:  Color.fromARGB(255, 28, 113, 76),)),
           home: BottomNavigation(),
          // home: LoginScreen(),
          // home: DoctorListScreen(),

          debugShowCheckedModeBanner: false,
        ));
  }
}
