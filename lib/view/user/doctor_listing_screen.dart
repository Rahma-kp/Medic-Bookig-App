import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medic/controller/doctor_list_provider.dart';
import 'package:medic/model/doctor_model.dart';
import 'package:medic/service/doctor_service.dart';
import 'package:medic/view/user/doctor_profile_screen.dart';
import 'package:provider/provider.dart';

class DoctorListScreen extends StatefulWidget {
  const DoctorListScreen({super.key});

  @override
  State<DoctorListScreen> createState() => _DoctorListScreenState();
}

class _DoctorListScreenState extends State<DoctorListScreen> {
  final DoctorService _doctorService = DoctorService();
  late Future<List<DoctorModel>> _doctorListFuture;

  @override
  void initState() {
    _doctorListFuture = _doctorService.getAllDoctors();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final getProvider = Provider.of<doctorListProvide>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color.fromARGB(255, 122, 182, 159),
        actions: [
          IconButton(
              onPressed: () {
                getProvider.seachShowing();
              },
              icon: Icon(Icons.search))
        ],
      ),
      backgroundColor: Color.fromARGB(255, 241, 240, 240),
      body: Column(
        children: [
          if (getProvider.isSearching) ...[
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search for doctors",
                  filled: true,
                  fillColor: Color.fromARGB(255, 193, 190, 190),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ],
          Expanded(
            child: FutureBuilder<List<DoctorModel>>(
              future: _doctorListFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      DoctorModel doctor = snapshot.data![index];
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  DoctorProfile(doctor: doctor),
                            ));
                          },
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border:
                                  Border.all(color: Colors.black, width: 0.5),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 10,
                                  left: 10,
                                  child: CircleAvatar(
                                    radius: 40,
                                    backgroundImage: doctor.image != null
                                        ? AssetImage(doctor.image!)
                                        : AssetImage(
                                            "assets/default_avatar.png"),
                                  ),
                                ),
                                Positioned(
                                  top: 15,
                                  left: 110,
                                  child: Text(
                                    doctor.fullName!,
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
                                    "${doctor.startTime!} to ${doctor.endTime!}",
                                    style: GoogleFonts.montserrat(
                                      color: Colors.black,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Center(child: Text('No doctors found'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
