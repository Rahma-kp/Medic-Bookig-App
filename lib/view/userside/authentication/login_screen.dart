import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medic/controller/authentication_provider.dart';
import 'package:medic/view/doctorside/wiget/bottom_bar.dart';
import 'package:medic/view/userside/authentication/Phone_authentication.dart';
import 'package:medic/view/userside/authentication/sign_up_screen.dart';
import 'package:medic/widget/bottom_bar.dart';
import 'package:medic/widget/navigation.dart';
import 'package:medic/widget/popup_widget.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
    final getProvider = Provider.of<AuthController>(context, listen: false);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 240, 240),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 100),
            child: Form(
              key: loginFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Log Your Account",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Text("Welcome back! Please enter your details"),
                  const SizedBox(height: 40),
                  TextFormField(
                    controller: getProvider.userNameController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.account_circle_outlined),
                      hintText: "Enter your Username",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: getProvider.emailController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.mail_outlined),
                      hintText: "Enter your email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      final RegExp emailRegex = RegExp(
                        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                      );
                      if (!emailRegex.hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: getProvider.passwordController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock_outline_sharp),
                      hintText: "Enter your Password",
                      suffixIcon: InkWell(
                        onTap: () { getProvider.togglePasswordVisibility();},
                        child: Icon(
                          getProvider.showPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 5),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "Forgot Password?",
                      style: GoogleFonts.aBeeZee(
                        color: const Color.fromARGB(255, 30, 138, 97),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: GestureDetector(
                      // onTap: () async {
                      //   if (loginFormKey.currentState!.validate()) {
                      //     try {
                      //       bool isDoctor = await getProvider.checkLogin();
                      //       if (isDoctor) {log('doctor');
                      //         NavigatorWidget().pushReplacement(context,
                      //             BottomDoctorNavigation(selectedIndex: 0));
                      //       } else {
                      //         await getProvider.signInWithEmail(
                      //             getProvider.emailController.text,
                      //             getProvider.passwordController.text);
                      //         PopupWidgets().showSuccessSnackbar(
                      //             context, 'User logged in');
                      //         NavigatorWidget().pushReplacement(
                      //             context, BottomNavigation(selectedIndex: 0));
                      //         getProvider.clearControllers();
                      //       }
                      //     } catch (e) {
                      //       getProvider.clearControllers();
                      //       PopupWidgets()
                      //           .showErrorSnackbar(context, 'User not found!');
                      //     }
                      //   }
                      // },
                      onTap: () async {
                        if (loginFormKey.currentState!.validate()) {
                          try {
                            bool isDoctor = await getProvider.checkLogin();
                            log('doctor');
                            if (isDoctor) {
                              log('doctors');
                              NavigatorWidget().pushReplacement(context,
                                  BottomDoctorNavigation(selectedIndex: 0));
                            } else {
                              PopupWidgets().showSuccessSnackbar(
                                  context, 'User logged in');
                              NavigatorWidget().pushReplacement(
                                  context, BottomNavigation(selectedIndex: 0));
                              getProvider.clearControllers();
                            }
                          } catch (e) {
                            getProvider.clearControllers();
                            PopupWidgets()
                                .showErrorSnackbar(context, 'User not found!');
                          }
                        }
                      },
                      child: Container(
                        height: 55,
                        width: 400,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color.fromARGB(255, 30, 138, 97),
                        ),
                        child: Center(
                          child: Text(
                            "Login",
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: InkWell(
                      onTap: () async {
                        getProvider.googleSignIn(context);
                      },
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/google.png",
                              height: 20,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "Login with Google",
                              style: GoogleFonts.montserrat(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const PhoneAuthentication(),
                        ));
                      },
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.phone_android),
                            const SizedBox(width: 10),
                            Text(
                              "Login with phone",
                              style: GoogleFonts.montserrat(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SignUpScreen(),
                          ));
                        },
                        child: const Text(
                          " Sign-Up",
                          style: TextStyle(
                            color: Color.fromARGB(255, 30, 138, 97),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
