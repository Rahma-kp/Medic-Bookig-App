import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medic/model/doctor_model.dart';
import 'package:medic/service/doctor_service.dart';

class DoctorListProvider extends ChangeNotifier {
  final DoctorService doctorService = DoctorService();
  late  Future<List<DoctorModel>> doctorListFuture;
 TextEditingController searchController= TextEditingController();
  List<DoctorModel> doctors = [];
  List<DoctorModel> _filteredDoctors = [];
  bool isSearching = false;

  List<DoctorModel> get filteredDoctors => _filteredDoctors;
  
 

  void toggleSearch() {
    isSearching = !isSearching;
    notifyListeners();
  }
  

  void searchDoctors(String query) {
    if (query.isEmpty) {
      _filteredDoctors = doctors;
    } else {
      _filteredDoctors = doctors.where((doctor) {
        final doctorName = doctor.fullName?.toLowerCase() ?? '';
        return doctorName.contains(query.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }
}