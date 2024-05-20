import 'package:flutter/material.dart';

class DoctorProfileProvider extends ChangeNotifier{
   bool isSummaryExpanded = false;
    void isExpaned(){
      isSummaryExpanded=!isSummaryExpanded;
      notifyListeners();

    }
}