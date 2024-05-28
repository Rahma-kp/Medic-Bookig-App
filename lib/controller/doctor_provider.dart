import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medic/model/doctor_model.dart';
import 'package:medic/service/doctor_service.dart';

class DoctorController extends ChangeNotifier{
  final DoctorService _doctorService = DoctorService();

  Future<void> addDoctor(DoctorModel doctor) async {
    try {
      await _doctorService.addDoctor(doctor);
      log('Doctor added successfully');
    } catch (error) {
      log('Error adding doctor: $error');
    }
  }

  Future<void> deleteDoctor(String id) async {
    try {
      await _doctorService.deleteDoctor(id);
      log('Doctor deleted successfully');
    } catch (error) {
      log('Error deleting doctor: $error');
    }
  }

  Future<List<DoctorModel>> getAllDoctors() async {
    try {
      return await _doctorService.getAllDoctors();
    } catch (error) {
      log('Error fetching all doctors: $error');
      return [];
    }
  }

  Future<List<DoctorModel>> getDoctorsByCategory(String category) async {
    try {
      return await _doctorService.getDoctorsByCategory(category);
    } catch (error) {
      log('Error fetching doctors by category: $error');
      return [];
    }
  }

  Future<String> uploadImage(String imageName, File imageFile) async {
    try {
      return await _doctorService.uploadImage(imageName, imageFile);
    } catch (error) {
      log('Error uploading image: $error');
      return '';
    }
  }

  Future<File?> pickImage(ImageSource source) async {
    try {
      return await _doctorService.pickImage(source);
    } catch (error) {
      log('Error picking image: $error');
      return null;
    }
  }
}
