import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medic/widget/bottom_bar.dart';

class PhoneAuthentication extends StatefulWidget {
  const PhoneAuthentication ({super.key});

  @override
  _PhoneAuthenticationState createState() => _PhoneAuthenticationState();
}

class _PhoneAuthenticationState extends State<PhoneAuthentication> {
  bool _showOTPField = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Loging With Your Phone",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text("Welcome! Please enter your details"),
                SizedBox(height: 20,),
                Text(
                  "Number",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone_android),
                    hintText: "Enter your Phone Number",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 25,),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _showOTPField = true;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 300,
                      child: Center(
                        child: Text(
                          "Send",
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 30, 138, 97),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                if (_showOTPField) ...[
                  Text(
                    "Verification OTP",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      hintText: "Enter Verification OTP",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
                SizedBox(height: 20,),
                Center(
                  child: GestureDetector(onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>BottomNavigation (),));
                  },
                    child: Container(
                          height: 50,
                          width: 300,
                          child: Center(
                            child: Text(
                              "Verify OTP",
                              style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 30, 138, 97),
                          ),
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
