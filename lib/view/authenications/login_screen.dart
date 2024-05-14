import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medic/controller/authentication_provider.dart';
import 'package:medic/view/authenications/Phone_authentication.dart';
import 'package:medic/view/authenications/sign_up_screen.dart';
import 'package:medic/widget/bottom_bar.dart';
import 'package:medic/widget/navigation.dart';
import 'package:medic/widget/popup_widget.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    bool isShowing = true;
    final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
    final getProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 240, 240),
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
                  Text(
                    "Log Your Account",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text("Welcome back! Please enter your details"),
                  SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    controller: getProvider.userNameController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.mail_outlined),
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
                  SizedBox(height: 15),
                  TextFormField(
                    controller: getProvider.emailController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.mail_outlined),
                      hintText: "Enter your email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: getProvider.passwordController,
                    obscureText: getProvider.showPassword,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline_sharp),
                      hintText: "Enter your Password",
                      suffixIcon: InkWell(
                          onTap: () => getProvider.togglePasswordVisibility(),
                          child: Icon(Icons.remove_red_eye_outlined)),
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
                  SizedBox(height: 5),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "Forgot Password?",
                      style: GoogleFonts.aBeeZee(
                        color: Color.fromARGB(255, 30, 138, 97),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: GestureDetector(
                      onTap: () async {
                        if (loginFormKey.currentState!.validate()) {
                          try {
                            await getProvider.signInWithEmail(
                                getProvider.emailController.text,
                                getProvider.passwordController.text);
                            PopupWidgets()
                                .showSuccessSnackbar(context, 'user logid in');
                            NavigatorWidget().pushReplacement(
                                context, BottomNavigation(selectedIndex: 0));
                            getProvider.clearControllers();
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
                        getProvider.googleSignIn();
                      },
                      child: Center(
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
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PhoneAuthentication(),
                        ));
                      },
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.phone_android),
                            SizedBox(width: 10),
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
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?"),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ));
                        },
                        child: Text(
                          "Sign-Up",
                          style: TextStyle(
                              color: Color.fromARGB(255, 30, 138, 97),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
