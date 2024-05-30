import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medic/model/user_model.dart';
import 'package:medic/service/firestore_service.dart';
import 'package:medic/view/userside/authentication/login_screen.dart';


class UserController extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();
  TextEditingController userBookingDateController = TextEditingController();
  TextEditingController userBookingResheduledController =
      TextEditingController();

  Future<void> goToLoginType(context) async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

   TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController websiteController = TextEditingController();
  TextEditingController qualificationController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  ImagePicker imagePicker = ImagePicker();
  FireStoreService _userService = FireStoreService();
  List<UserModel>? allUsers;
  UserModel? currentUser;
  UserModel? sortedUser;
  String? profileUrl;
  String? profilePath;
  File? pickedImage;
  bool isLoading = false;

 

  getAllUser() async {
    allUsers = await _userService.getAllUser();
    notifyListeners();
  }

  getCurrentUser() async {
    currentUser = null;
    currentUser = await _userService.getCurrentUser();
    notifyListeners();
  }

  uploadProfileImage({String? imagePath}) async {
    try {
      // isLoading = true;
      if (pickedImage != null) {
        log(pickedImage!.path);
        profilePath = await _userService
            .updateProfilePic(File(pickedImage!.path), imagePath: imagePath);
        if (profilePath != null) {
          // profilePath = await profileImage!.fullPath;
          // profileUrl = await profileImage!.getDownloadURL();
          notifyListeners();
        }
        pickedImage = null;
      } else {
        log('image is null');
      }
      // isLoading = false;
    } catch (e) {
      // isLoading = false;
      log(e.toString());
    }
  }

  pickProfileImage(ImageSource source) async {
    // isLoading = true;
    final img = await imagePicker.pickImage(source: source);
    if (img != null) {
      pickedImage = File(img.path);
      log('Image selected');
      notifyListeners();
    } else {
      log('No Image selected');
    }
    // isLoading = false;
  }

  pickDate(BuildContext context) async {
    // isLoading = true;
    final pickedDate = await showDatePicker(
        initialDate: DateTime.now(),
        context: context,
        firstDate: DateTime(1980),
        lastDate: DateTime.now());
    if (pickedDate != null) {
      // dobController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
    }
    // isLoading = false;
    notifyListeners();
  }

  updateUserDetail(context) async {
    isLoading = await true;
    notifyListeners();
    if (pickedImage != null) {
      await uploadProfileImage(imagePath: currentUser!.profilePath);
    }

    final data = UserModel(
        uId: currentUser!.uId,
        age: currentUser!.age,
        email:  currentUser!.email,
        profilePath: profilePath,
        phone: phoneController.text.trim(),
      userName:nameController.text.trim() 
        );
    await _userService.updateUserDetails(data);

    getCurrentUser();
    isLoading = await false;
    notifyListeners();
  }

  isLoadingFunction(bool value) {
    isLoading = value;
    notifyListeners();
  }

  getSortedUser(String adminId) async {
    await getAllUser();
    return sortedUser =
        allUsers!.firstWhere((element) => element.uId == adminId);
    // notifyListeners();
  }
}