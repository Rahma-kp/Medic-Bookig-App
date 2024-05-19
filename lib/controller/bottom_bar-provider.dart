import 'package:flutter/material.dart';
import 'package:medic/view/adminside/admin_home.dart';
import 'package:medic/view/adminside/admin_profile.dart';
import 'package:medic/view/adminside/doctors_adding_admin.dart';

class BottomBarProvider extends ChangeNotifier {
  int userCurrentIndex = 0;
  int adminCurrentIndex = 0;
  
  navigatePage(int index) {
    userCurrentIndex = index;
    notifyListeners();
  }
      void adminOnTap(int index) {
    adminCurrentIndex = index;
    notifyListeners();
  }
  List adminScreens = [
    const AdminHomeScreen(),
    const DoctorAddingScreen(),
    const AdminProfileScreen(),
  ];
}