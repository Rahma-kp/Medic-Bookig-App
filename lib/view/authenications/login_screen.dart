import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medic/view/authenications/Phone_authentication.dart';
import 'package:medic/view/authenications/sign_up_screen.dart';
import 'package:medic/widget/bottom_bar.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Log Your Account",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text("Welcome back ! Please enter your details"),
              SizedBox(
                height: 40,
              ),
              Text(
                "Email",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              TextFormField(
                decoration: InputDecoration(fillColor: Colors.white,
                    prefixIcon: Icon(Icons.mail_outlined),
                    hintText: "Enter your email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(height: 25,),
              Text(
                "Password",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline_sharp),
                    hintText: "Enter your email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(height: 5,),
              Align(alignment: Alignment.topRight,
                child: Text("Forgot Password?",style:GoogleFonts.aBeeZee(color: Color.fromARGB(255, 30, 138, 97),) ,)),
              SizedBox(height: 40,),
              Center(
                child: GestureDetector(onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) =>BottomNavigation (),));
                },
                  child: Container(
                    height: 50,
                    width: 300,
                    child: Center(
                      child: Text("Login",style: GoogleFonts.montserrat(
                                color:Colors.white,
                                fontSize:20,
                                fontWeight: FontWeight.bold,
                              ),),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 30, 138, 97),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
               Center(
                child: InkWell(onTap: () {
                  
                },
                  child: Container(
                    height: 50,
                    width: 300,
                    child: Center(
                      child: Row(
                        mainAxisAlignment:  MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/google.png",height: 20
                          ,),SizedBox(width: 10,),
                          Text("Login with Google",style: GoogleFonts.montserrat(
                                    fontSize:15,
                                  ),),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(border: Border.all(color: Color.fromARGB(255, 30, 138, 97),),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
               Center(
                child: GestureDetector(onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) =>PhoneAuthentication() ,));
                },
                  child: Container(
                    height: 50,
                    width: 300,
                    child: Center(
                      child: Row(
                        mainAxisAlignment:  MainAxisAlignment.center,
                        children: [Icon(Icons.phone_android),
                          SizedBox(width: 10,),
                          Text("Login with phone",style: GoogleFonts.montserrat(
                                    fontSize:15,
                                  ),),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(border: Border.all(color: Color.fromARGB(255, 30, 138, 97),),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?"),
                    InkWell(onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpScreen(),));
                    },
                      child: Text("Sign-Up",style: TextStyle(color:Color.fromARGB(255, 30, 138, 97),),))
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
