import 'package:flutter/material.dart';

class HomeCaroselController extends ChangeNotifier{
   int current = 0;
    carouselChange(int index ){
      current = index;
      notifyListeners();
    }
}