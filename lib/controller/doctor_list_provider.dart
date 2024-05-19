import 'package:flutter/material.dart';

class doctorListProvide extends ChangeNotifier{
    bool isSearching =false;
    void seachShowing(){
       isSearching=!isSearching;
       notifyListeners();
    }
}