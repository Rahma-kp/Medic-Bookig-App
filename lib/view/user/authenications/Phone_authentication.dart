import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medic/controller/authentication_provider.dart';
import 'package:medic/widget/bottom_bar.dart';
import 'package:medic/widget/popup_widget.dart';
import 'package:provider/provider.dart';

class PhoneAuthentication extends StatefulWidget {
  const PhoneAuthentication({Key? key}) : super(key: key);

  @override
  _PhoneAuthenticationState createState() => _PhoneAuthenticationState();
}

class _PhoneAuthenticationState extends State<PhoneAuthentication> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final getProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 241, 240, 240),
      ),
      backgroundColor: Color.fromARGB(255, 241, 240, 240),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Loging With Your Phone",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text("Welcome! Please enter your details"),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Number",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  TextFormField(
                    controller: getProvider.phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone_android),
                      hintText: "Enter your Phone Number",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      if (value.length != 10) {
                        return 'Phone number must be 10 digits';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: ()async {
                        if (_formKey.currentState!.validate()) {
                          try {
                            if (getProvider.phoneController.text.length == 10) {
                              getProvider.getOtp(
                                "+${getProvider.selectCountry.phoneCode}${getProvider.phoneController.text}",
                              );
                              await getProvider.showOtp();
                              PopupWidgets().showSuccessSnackbar(
                                  context, "OTP sent Successfully");
                            } 
                          } catch (e) {
                              getProvider.clearControllers();
                            PopupWidgets().showErrorSnackbar(context, 'some error there!');
                          }
                        }
                      },
                      child: Container(
                        height: 50,
                        width: 400,
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
                          borderRadius: BorderRadius.circular(5),
                          color: Color.fromARGB(255, 30, 138, 97),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  if (getProvider.showOtpField) ...[
                    Text(
                      "Verification OTP",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    TextFormField(
                      controller: getProvider.otpController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        hintText: "Enter Verification OTP",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the verification OTP';
                        }

                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            try {
                              await getProvider.verifyOtp(
                                  getProvider.otpController.text, context);
                              Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      BottomNavigation(selectedIndex: 0),
                                ),
                                (route) => false,
                              );
                              getProvider.clearControllers();
                            } catch (e) {
                              PopupWidgets().showErrorSnackbar(
                                  context, "Failed to verify OTP");
                            }
                          }
                        },
                        child: Container(
                          height: 50,
                          width: 400,
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
                            borderRadius: BorderRadius.circular(5),
                            color: Color.fromARGB(255, 30, 138, 97),
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
