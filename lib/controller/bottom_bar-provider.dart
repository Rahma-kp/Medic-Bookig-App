import 'package:flutter/material.dart';

class BottomBarProvider extends ChangeNotifier {
  int _currentIndex = 0;
  int initIndex = 0;
  
  int get currentIndex => _currentIndex;

  void setInitIndex(int index) {
    initIndex = index;
    _currentIndex = index;
  }

  void navigatePage(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
