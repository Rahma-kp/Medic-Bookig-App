import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medic/view/settings/widget/textform_widget.dart';

class ProfileEditingScreen extends StatelessWidget {
  const ProfileEditingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController userNameController = TextEditingController();
    TextEditingController ageController = TextEditingController();
    TextEditingController bloodGroupController = TextEditingController();
    TextEditingController heightController = TextEditingController();
    TextEditingController weightController = TextEditingController();

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Your Profile",
          style: GoogleFonts.montserrat(
              fontSize: size.width * 0.05,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color.fromARGB(255, 122, 182, 159),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, bottom: 20, top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage("assets/profile.jpeg"),
                  ),
                  editingTextForm(
                    size: size,
                    userNameController: userNameController,
                    hintxt: "Enter your name",
                    labletxt: 'Name',
                  ),
                  editingTextForm(
                      size: size,
                      userNameController: ageController,
                      labletxt: "Age",
                      hintxt: "Enter your age"),
                  editingTextForm(
                      size: size,
                      userNameController: bloodGroupController,
                      labletxt: 'Blood Group',
                      hintxt: "Enter your blood group"),
                  editingTextForm(
                      size: size,
                      userNameController: heightController,
                      labletxt: "Height",
                      hintxt: "Enter your height"),
                  editingTextForm(
                      size: size,
                      userNameController: weightController,
                      labletxt: "Weight",
                      hintxt: "Enter your weight"),
           
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: 50,
                      width: 200,
                      child: Center(
                          child: Text("Confirm",
                              style: GoogleFonts.aBeeZee(
                                  color: Colors.white,
                                  fontSize: size.width * 0.05,
                                  fontWeight: FontWeight.bold))),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 122, 182, 159),
                          borderRadius: BorderRadius.circular(15)),
                    ),
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
