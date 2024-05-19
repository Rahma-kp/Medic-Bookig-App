import 'package:flutter/material.dart';
import 'package:medic/controller/bottom_bar-provider.dart';
import 'package:medic/widget/text_widget.dart';
import 'package:provider/provider.dart';
import 'package:enefty_icons/enefty_icons.dart';

class AdminBottomBar extends StatelessWidget {
  const AdminBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 240, 242),
      body: Consumer<BottomBarProvider>(
          builder: (context, value, child) =>
              value.adminScreens[value.adminCurrentIndex]),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
        child: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 238, 240, 242),
          ),
          height: size.height * .09,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Consumer<BottomBarProvider>(
              builder: (context, value, child) => BottomNavigationBar(
                unselectedFontSize: 11,
                selectedFontSize: 12,
                type: BottomNavigationBarType.fixed,
                onTap: value.adminOnTap,
                backgroundColor: const Color(0xFFFFFFFF),
                currentIndex: value.adminCurrentIndex,
                selectedItemColor: const Color(0xFF1995AD),
                unselectedItemColor: const Color(0xFF98A3B3),
                showUnselectedLabels: true,
                items: [
                  BottomNavigationBarItem(
                    icon: value.adminCurrentIndex == 0
                        ? const Icon(EneftyIcons.home_outline)
                        : const Icon(EneftyIcons.home_3_outline),
                    label: poppinsText(
                      text: 'Home',
                      color: const Color(0xFF98A3B3),
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                    ).data,
                  ),
                  BottomNavigationBarItem(
                    icon: value.adminCurrentIndex == 1
                        ? const Icon(EneftyIcons.user_add_bold)
                        : const Icon(EneftyIcons.user_add_outline),
                    label: poppinsText(
                      text: 'Add',
                      color: const Color(0xFF98A3B3),
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ).data,
                  ),
                  BottomNavigationBarItem(
                    icon: value.adminCurrentIndex == 2
                        ? const Icon(EneftyIcons.profile_circle_bold)
                        : const Icon(EneftyIcons.profile_outline),
                    label: poppinsText(
                      text: 'Profile',
                      color: const Color(0xFF98A3B3),
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ).data,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}