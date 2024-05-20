import 'package:flutter/material.dart';
import 'package:medic/model/doctor_model.dart';
import 'package:medic/service/doctor_service.dart';

class DoctorListProvider with ChangeNotifier {
  bool _isSearching = false;
  List<DoctorModel> _allDoctors = [];
  List<DoctorModel> _filteredDoctors = [];

  bool get isSearching => _isSearching;
  List<DoctorModel> get filteredDoctors => _filteredDoctors;

  void toggleSearch() {
    _isSearching = !_isSearching;
    notifyListeners();
  }

  void setDoctors(List<DoctorModel> doctors) {
    _allDoctors = doctors;
    _filteredDoctors = doctors;
  }

  void searchDoctors(String query) {
    if (query.isEmpty) {
      _filteredDoctors = _allDoctors;
    } else {
      _filteredDoctors = _allDoctors
          .where((doctor) => doctor.fullName!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
