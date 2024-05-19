import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medic/view/user/authenications/login_screen.dart';
import 'package:medic/view/user/user_setting_screens/feed_back_screen.dart';
import 'package:medic/view/user/user_setting_screens/profile_editing_screen.dart';
import 'package:medic/view/user/user_setting_screens/terms_conditions_screen.dart';
import 'package:medic/view/user/user_setting_screens/widget/logout_dailoguebox.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, bottom: 15),
              child: Text('Settings',
                  style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: size.width * 0.06,
                      fontWeight: FontWeight.w600)),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Stack(
                children: [
                  Container(
                    height: 220,
                    width: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 122, 182, 159),
                    ),
                  ),
                  Positioned(
                      top: 20,
                      left: 10,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ProfileEditingScreen(),
                          ));
                        },
                        child: const Row(
                          children: [
                            Icon(
                              Icons.account_circle_outlined,
                              size: 40,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Profile",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )
                          ],
                        ),
                      )),
                  Positioned(
                      top: 80,
                      left: 10,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => FeedBackScreen(),
                          ));
                        },
                        child: const Row(
                          children: [
                            Icon(
                              Icons.info_outline_rounded,
                              size: 40,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Feed Back",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )
                          ],
                        ),
                      )),
                  Positioned(
                      top: 150,
                      left: 10,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const TermsConditionScreen(),
                          ));
                        },
                        child: const Row(
                          children: [
                            Icon(
                              Icons.inventory_rounded,
                              size: 40,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Terms & Conditions",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Stack(
                children: [
                  Container(
                    height: 150,
                    width: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 122, 182, 159),
                    ),
                  ),
                  Positioned(
                      top: 20,
                      left: 10,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ));
                        },
                        child: const Row(
                          children: [
                            Icon(
                              Icons.restore,
                              size: 40,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Reset the app",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )
                          ],
                        ),
                      )),
                  Positioned(
                      top: 80,
                      left: 10,
                      child: GestureDetector(
                          onTap: () {
                            showLogoutDialog(context);
                          },
                          child: const Row(
                            children: [
                              Icon(
                                Icons.logout_outlined,
                                size: 40,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Log Out",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )
                            ],
                          ))),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  
}
