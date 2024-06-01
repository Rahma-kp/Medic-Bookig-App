import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:medic/controller/bottom_bar-provider.dart';
import 'package:medic/view/doctorside/appoinment_screen.dart';
import 'package:medic/view/doctorside/profile.dart';
import 'package:medic/view/doctorside/review_screen.dart';
import 'package:medic/view/userside/chat/chatlist_screen.dart';
import 'package:provider/provider.dart';

class BottomDoctorNavigation extends StatelessWidget {
  final List<Widget> _pages = [
    AppointmentDoctors(),
    DoctorReviewScreen(),
  
    DoctorProfileScreen()
  
  ];

  final int selectedIndex;

  BottomDoctorNavigation({Key? key, required this.selectedIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bottomProvider = Provider.of<BottomBarProvider>(context);
    bottomProvider.initIndex;
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[bottomProvider.currentIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: NavigationBar(
            backgroundColor: Colors.white,
            selectedIndex: bottomProvider.currentIndex,
            onDestinationSelected: (index) {
              bottomProvider.navigatePage(index);
            },
            destinations: [
              NavigationDestination(
                icon: Icon(
                  FeatherIcons.calendar,
                  color: bottomProvider.currentIndex == 0
                      ? Colors.white
                      : Colors.black,
                ),
                label: 'Appoinment',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.feed_outlined,
                  size: 30,
                  color: bottomProvider.currentIndex == 1
                      ? Colors.white
                      : Colors.black,
                ),
                label: 'FeedBack',
              ),
              NavigationDestination(
                icon: Icon(
                  FeatherIcons.messageCircle,
                  size: 30,
                  color: bottomProvider.currentIndex == 2
                      ? Colors.white
                      : Colors.black,
                ),
                label: 'Chat',
              ),
              NavigationDestination(
                icon: Icon(
                  FeatherIcons.user,
                  color: bottomProvider.currentIndex == 3
                      ? Colors.white
                      : Colors.black,
                ),
                label: 'Profile',
              ),
            ],
            indicatorColor: Color.fromARGB(255, 71, 153, 124),
            surfaceTintColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
