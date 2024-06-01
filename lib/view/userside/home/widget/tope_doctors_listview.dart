import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medic/controller/doctor_provider.dart';
import 'package:medic/model/doctor_model.dart';
import 'package:medic/view/userside/appoinment/doctor_profile_screen.dart';
import 'package:medic/widget/navigation.dart';
import 'package:provider/provider.dart';

class DoctorsListView extends StatelessWidget {
  final List<DoctorModel> doctor;

  const DoctorsListView({
    super.key,
    required this.size,
    required this.doctor,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    final topRatedDoctors = (doctor
          ..sort((a, b) =>
              _parseRating(b.rating!).compareTo(_parseRating(a.rating!))))
        .take(5)
        .toList();

    return Container(
      margin: const EdgeInsets.only(bottom: 5, top: 5),
      height: size.height * 0.6,
      child: ListView.builder(
        itemCount: topRatedDoctors.length,
        itemBuilder: (context, index) {
          final doctor = topRatedDoctors[index];
          return Padding(
            padding:
                const EdgeInsets.only(left: 5, right: 5, bottom: 5, top: 5),
            child: GestureDetector(
              onTap: () {
                NavigatorWidget().push(context, DoctorProfile(doctor: doctor));
              },
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color.fromARGB(255, 159, 157, 157),
                            width: 2.0,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 36,
                          backgroundImage: NetworkImage(doctor.image!),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 15,
                      left: 110,
                      child: Text(
                        "Dr.${doctor.fullName!}",
                        style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 40,
                      left: 110,
                      child: Text(
                        doctor.category!,
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      right: 10,
                      child: Text(
                        "${doctor.startTime} to ${doctor.endTime}",
                        style: GoogleFonts.montserrat(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 10,
                      top: 27,
                      child: Consumer<DoctorController>(
                        builder: (context, value, child) {
                          final isFavourite = value.wishListCheck(doctor);
                          return IconButton(
                            onPressed: () {
                              value.wishlistClicked(doctor.id!, isFavourite);
                            },
                            icon: Icon(
                              isFavourite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              size: 30,
                              color: Colors.red,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  double _parseRating(String rating) {
    try {
      return double.parse(rating);
    } catch (e) {
      return 0.0;
    }
  }
}
