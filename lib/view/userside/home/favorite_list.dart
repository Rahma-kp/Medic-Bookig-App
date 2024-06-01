import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medic/controller/doctor_provider.dart';
import 'package:medic/view/userside/appoinment/doctor_profile_screen.dart';
import 'package:medic/widget/navigation.dart';
import 'package:medic/widget/text_widget.dart';
import 'package:provider/provider.dart';

class FavouriteDoctorsScreen extends StatelessWidget {
  const FavouriteDoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: const Color.fromARGB(255, 231, 230, 227),
      appBar: AppBar(       backgroundColor: Color.fromARGB(255, 29, 141, 102),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios,color: Colors.white,),
        ),
        title: poppinsHeadText(text: 'Favourite', fontSize: 20,color: Colors.white),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Consumer<DoctorController>(
          builder: (context, doctorController, child) {
            final favouriteItems = doctorController.getFavoriteDoctors();
            if (favouriteItems.isEmpty) {
              return Center(
                child: Text("SDFGHJKL"),
              );
            } else {
              return ListView.builder(
                itemCount: favouriteItems.length,
                itemBuilder: (context, index) {
                  final doctor = favouriteItems[index];
                  return GestureDetector(onTap: () {
                    NavigatorWidget().push(context, DoctorProfile(doctor: doctor));
                  },
                    child: Container(
                      height: 100,
                      margin: const EdgeInsets.symmetric(vertical: 5),
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
                            top: 20,
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
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
