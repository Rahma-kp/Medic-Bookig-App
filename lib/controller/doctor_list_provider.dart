import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medic/model/doctor_model.dart';
import 'package:medic/service/doctor_service.dart';

class DoctorListProvider extends ChangeNotifier {
  final DoctorService doctorService = DoctorService();
  late  Future<List<DoctorModel>> doctorListFuture;
 TextEditingController searchController= TextEditingController();
  List<DoctorModel> doctors = [];
  List<DoctorModel> filteredDoctors = [];
  bool isSearching = false;


  void toggleSearch() {
    isSearching = !isSearching;
    notifyListeners();
  }
  

  
  Future<void> wishlistClicked(String id, bool status) async {
    await doctorService.wishListClicked(id, status);
    notifyListeners();
  }

}   
