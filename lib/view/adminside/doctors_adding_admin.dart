import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:medic/controller/admin_provider.dart';
import 'package:medic/controller/authentication_provider.dart';
import 'package:medic/model/doctor_model.dart';
import 'package:medic/view/adminside/admin_widget.dart';
import 'package:medic/widget/popup_widget.dart';
import 'package:medic/widget/text_widget.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:enefty_icons/enefty_icons.dart';


class DoctorAddingScreen extends StatelessWidget {
  const DoctorAddingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final adminProvider = Provider.of<AdminProvider>(context, listen: false);
    final authProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: interHeadText(
          text: 'Add Doctors',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(height: size.height * .02),
              Consumer<AdminProvider>(
                builder: (context, value, child) => Stack(
                  children: [
                    CircleAvatar(
                      radius: 70,
                      backgroundColor: Color(0xFFE3E3E3),
                      backgroundImage: value.doctorImage != null
                          ? Image.file(value.doctorImage!).image
                          : const AssetImage(
                              ''),
                    ),
                    Positioned(
                      bottom: 0,
                      right: size.width * .05,
                      child: Container(
                        height: size.height * .04,
                        width: size.width * .08,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          onPressed: () {
                            pickImage(context);
                          }, 
                          icon: const Icon(
                            EneftyIcons.edit_2_bold,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // SizedBox(
              //   height: size.height * 1,
              //   child: Form(
              //     key: authProvider.doctorAddFormKey,
              //     child: adminDoctorAddFields(size, context, adminProvider),
              //   ),
              // ),
              // ================================================
              // elevatedButtonWidget(
              //   buttonHeight: size.height * .058,
              //   buttonWidth: size.width * .9,
              //   buttonText: 'Add Doctor',
              //   onPressed: () {
              //     if (authProvider.doctorAddFormKey.currentState!.validate()) {
              //       int rating =
              //           int.parse(adminProvider.doctorRatingController.text);

              //       if (rating > 5) {
              //         PopupWidgets(). showErrorSnackbar(
              //             context, 'Rating should be 5 or less');
              //       } else {
              //         addData(context, adminProvider);
              //         adminProvider.clearDoctorAddingControllers();
              //       }
              //     }
              //   },
              // ),
              SizedBox(height: size.height * .02)
            ],
          ),
        ),
      ),
    );
  }

  Future<void> pickImage(BuildContext context) async {
    final pro = Provider.of<AdminProvider>(context, listen: false);
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Camera'),
                onTap: () {
                  Navigator.pop(context);
                  pro.getImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text('Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  pro.getImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> addData(
      BuildContext context, AdminProvider adminProvider) async {
    final pickedImage = adminProvider.doctorImage;
    if (pickedImage != null) {
      // adminProvider.setIsAddingData(true);
      final image = await adminProvider.uploadImage(
          File(pickedImage.path), adminProvider.imageName);

      final cars = DoctorModel(
          image: image,
          fullName: adminProvider.doctorNameController.text,
          age: adminProvider.doctorAgeController.text,
          gender: adminProvider.selectedGender,
          category: adminProvider.selectedCategory,
          position: adminProvider.selectedPosition,
          aboutDoctor: adminProvider.doctorAboutController.text,
          workingDays: adminProvider.selectedWorkingDays,
          startTime: adminProvider.doctorAppointmentTimeController.text,
          endTime: adminProvider.doctorAppointmentEndTimeController.text,
          patients: adminProvider.doctorPatientsController.text,
          experience: adminProvider.doctorExperienceController.text,
          rating: int.parse(adminProvider.doctorRatingController.text));

      adminProvider.addCar(cars);

      adminProvider.clearDoctorAddingControllers();

      PopupWidgets().showSuccessSnackbar(context, "Doctor Added Successfully");
    } else {
    PopupWidgets().showErrorSnackbar(context, "Failed to Add try once more");
      log('Error: pickedImage is null');
    }
    // carProvider.setIsAddingData(false);
  }
}