import 'dart:developer';
import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:medic/model/usemodel.dart';
import 'package:medic/service/authentication_service.dart';

class AuthenticationProvider extends ChangeNotifier {
  final AuthService  authService = AuthService ();
  TextEditingController userNameController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  UserModel? currentUser;
   bool showPassword = true;
   bool showOtpField = false;

   Country selectCountry = Country(
      phoneCode: '91',
      countryCode: "IN",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: "INDIA",
      example: "INDIA",
      displayName: "INDIA",
      displayNameNoCountryCode: "IN",
      e164Key: "");
 

  Future<UserCredential> signUpWithEmail(String email, String password) async {
    return await authService.signUpEmail(email, password);
  }

  Future<UserCredential> signInWithEmail(String email, String password) async {
    return await authService.signInEmail(email, password);
  }

  Future<void> signOutWithEmail() async {
    return await authService.signOutEmail();
  }

  Future<void> googleSignIn() async {
    await authService.googleSignIn();
    notifyListeners();
  }

  Future<void> googleSignOut() async {
    await GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    notifyListeners();
  } 
 getUser() async {
  currentUser = await authService.getCurrentUser();
  if (currentUser != null) {
    log(currentUser!.email!);
  }
  notifyListeners();
}



  void togglePasswordVisibility() {
    showPassword = !showPassword;
    notifyListeners();
  }

 void showOtp() {
    showOtpField = true;
    notifyListeners();
  }
    Future<void> getOtp(phoneNumber) async {
    await authService.getOtp(phoneNumber);
    notifyListeners();
  }


  Future<void> verifyOtp(otp, context) async {
    await authService.verifyOtp(otp, context);
    notifyListeners();
  }

   countrySelection(value) {
    selectCountry = value;
    notifyListeners();
  }


 clearControllers() {
    userNameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    phoneController.clear();
    otpController.clear();
    notifyListeners();
  }
}