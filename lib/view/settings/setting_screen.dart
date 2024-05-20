import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medic/view/settings/feed_back_screen.dart';
import 'package:medic/view/settings/profile_editing_screen.dart';
import 'package:medic/view/settings/terms_conditions_screen.dart';
import 'package:medic/view/settings/widget/logout_dailoguebox.dart';
import 'package:medic/view/settings/widget/setting_widget.dart';

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
                   SettingWidget(
                      txt: "Profile",
                      top: 20,
                      left: 10,
                      iconData: Icons.account_circle_outlined,
                    navigatorBuilder: (context) =>  ProfileEditingScreen()),
                  SettingWidget(
                      txt: "Feed Back",
                      top: 80,
                      left: 10,
                      iconData: Icons.info_outline_rounded,
                      navigatorBuilder: (context) =>  FeedBackScreen()),
                   SettingWidget(
                      txt: 'Terms & Conditions',
                      top: 150,
                      left: 10,
                      iconData: Icons.inventory_outlined,
                      navigatorBuilder: (context) =>  TermsConditionScreen())
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
                   SettingWidget(
                      txt: "Reset the app",
                      top: 20,
                      left: 10,
                      iconData: Icons.restore,
                       navigatorBuilder: (context) => FeedBackScreen(),),
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
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
