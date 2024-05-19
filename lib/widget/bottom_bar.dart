

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:medic/controller/bottom_bar-provider.dart';
import 'package:medic/view/user/appoinment/appoinment_tabs.dart';
import 'package:medic/view/user/home_screens/home_screen.dart';
import 'package:medic/view/user/user_setting_screens/profile_screen.dart';
import 'package:medic/view/user/chatscreens/chat_list_screen.dart';

import 'package:provider/provider.dart';

class BottomNavigation extends StatelessWidget {

  final List<Widget> _pages = [
    HomeScreen(),
    AppointmentScreen(),
    ChatListingScreen(),
    ProfileScreen(),
   
  ];
final int selectedIndex;
   BottomNavigation({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    final bottomProvider = Provider.of<BottomBarProvider>(context);
    return Scaffold(
      backgroundColor:Colors.white,
      body: _pages[bottomProvider.userCurrentIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: NavigationBar(
            backgroundColor:Colors.white,
            selectedIndex: bottomProvider.userCurrentIndex,
            onDestinationSelected: (index) {
              bottomProvider.navigatePage(index);
            },
            destinations: [
              NavigationDestination(
                icon: Icon(FeatherIcons.home,
                    color: bottomProvider.userCurrentIndex == 0
                        ? Colors.white
                        :Colors.black),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(FeatherIcons.calendar,
                    size: 30,
                    color: bottomProvider.userCurrentIndex == 1
                        ? Colors.white
                        :Colors.black),
                label: 'Appoinment',
              ),
              NavigationDestination(
                icon: Icon(FeatherIcons.messageCircle,
                    size: 30,
                    color: bottomProvider.userCurrentIndex == 2
                        ? Colors.white
                        : Colors.black),
                label: 'Chat',
              ),
              NavigationDestination(
                icon: Icon(FeatherIcons.user,
                    color: bottomProvider.userCurrentIndex == 3
                        ? Colors.white
                        : Colors.black),
                label: 'User',
              ),
            ],
            indicatorColor:Color.fromARGB(255, 71, 153, 124),
            surfaceTintColor:Colors.white
          ),
        ),
      ),
    );
  }
}