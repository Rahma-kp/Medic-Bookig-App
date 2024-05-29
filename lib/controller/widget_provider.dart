import 'package:flutter/material.dart';

class WidgetController extends ChangeNotifier {
  // text Fields
  bool obscureText = true;
  obscureTextValue() {
    obscureText = !obscureText;
    notifyListeners();
  }

  // bottom bar
  int currentIndex = 0;
  currentIndexChanging(value) {
    currentIndex = value;
    notifyListeners();
  }

  bool isLoading = false;
  showCircleIndicator(bool value) {
    isLoading = value;
    notifyListeners();
  }
}