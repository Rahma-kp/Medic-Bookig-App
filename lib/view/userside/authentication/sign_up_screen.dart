import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medic/controller/authentication_provider.dart';
import 'package:medic/view/userside/authentication/Phone_authentication.dart';
import 'package:medic/widget/bottom_bar.dart';
import 'package:medic/widget/popup_widget.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();
    final getProvider =
        Provider.of<AuthController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 241, 240, 240),
      ),
      backgroundColor: Color.fromARGB(255, 241, 240, 240),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _signUpFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Create an account",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text("Welcome! Please enter your details"),
                SizedBox(
                  height: 40,
                ),
                Text(
                  "Username",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                TextFormField(
                  controller: getProvider.userNameController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.account_circle_outlined),
                      hintText: "Enter your name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Email",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                TextFormField(
                  controller: getProvider.emailController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.mail_outlined),
                      hintText: "Enter your email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
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
                SizedBox(height: 10),
                Text(
                  "Password",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                TextFormField(
                  obscureText: true,
                  controller: getProvider.passwordController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline_sharp),
                      hintText: "Enter your password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                Text(
                  "Confirm Password",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                TextFormField(
                  obscureText: true,
                  controller: getProvider.confirmPasswordController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline_sharp),
                      hintText: "Enter your confirm password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your confirm password';
                    }
                    if (value != getProvider.passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Center(
                  child: GestureDetector(
                    onTap: () async {
                      if (_signUpFormKey.currentState!.validate()) {
                        try {
                          getProvider.signUpWithEmail(getProvider.emailController.text,
                                getProvider.passwordController.text);
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) =>
                                  BottomNavigation(selectedIndex: 0),
                            ),
                            (Route<dynamic> route) => false,
                          );
                          PopupWidgets().showSuccessSnackbar(
                              context, 'Account has been created');
                          getProvider.clearControllers();
                        } catch (e) {
                          PopupWidgets().showErrorSnackbar(
                              context, 'Account not created, try again');
                        }
                      }
                    },
                    child: Container(
                      height: 50,
                      width: 400,
                      child: Center(
                        child: Text(
                          "Sign-Up",
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color.fromARGB(255, 30, 138, 97),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: InkWell(
                    onTap: () {
                      getProvider.googleSignIn(context);
                      
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/google.png",
                          height: 20,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Login with Google",
                          style: GoogleFonts.montserrat(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: GestureDetector(
                    // onTap: () {
                    //   Navigator.of(context).push(
                    //     MaterialPageRoute(
                    //       builder: (context) => PhoneAuthentication(),
                    //     ),
                    //   );
                    // },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.phone_android),
                        SizedBox(width: 10),
                        Text(
                          "Login with phone",
                          style: GoogleFonts.montserrat(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?"),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Color.fromARGB(255, 30, 138, 97),
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}