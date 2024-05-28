import 'package:flutter/material.dart';

class BottomBarProvider extends ChangeNotifier {
  int currentIndex = 0;
  int initIndex = 0;
  
  // int get currentIndex => _currentIndex;

  void setInitIndex(int index) {
    initIndex = index;
    currentIndex = index;
  }

  void navigatePage(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
