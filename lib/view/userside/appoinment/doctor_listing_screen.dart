import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medic/controller/doctor_list_provider.dart';
import 'package:medic/model/doctor_model.dart';
import 'package:medic/service/doctor_service.dart';
import 'package:medic/view/userside/appoinment/doctor_profile_screen.dart';
import 'package:provider/provider.dart';

class DoctorListScreen extends StatefulWidget {
  final String? category;

  const DoctorListScreen({Key? key, this.category}) : super(key: key);

  @override
  State<DoctorListScreen> createState() => _DoctorListScreenState();
}

class _DoctorListScreenState extends State<DoctorListScreen> {
  final DoctorService _doctorService = DoctorService();
  late Future<List<DoctorModel>> _doctorListFuture;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchDoctors();
  }

  void _fetchDoctors() {
    setState(() {
      _doctorListFuture = widget.category != null
          ? _doctorService.getDoctorsByCategory(widget.category!)
          : _doctorService.getAllDoctors();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color.fromARGB(255, 122, 182, 159),
        actions: [
          Consumer<DoctorListProvider>(
            builder: (context, doctorListProvider, child) {
              return IconButton(
                onPressed: () {
                  doctorListProvider.toggleSearch();
                },
                icon: Icon(Icons.search),
              );
            },
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 241, 240, 240),
      body: Column(
        children: [
          Consumer<DoctorListProvider>(
            builder: (context, doctorListProvider, child) {
              if (doctorListProvider.isSearching) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextFormField(
                    controller: _searchController,
                    onChanged: (query) {
                      doctorListProvider.searchDoctors(query);
                    },
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
                );
              }
              return Container();
            },
          ),
          Expanded(
            child: FutureBuilder<List<DoctorModel>>(
              future: _doctorListFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData) {
                  List<DoctorModel> doctors = snapshot.data!;
                  final doctorListProvider = Provider.of<DoctorListProvider>(context);
                  // doctorListProvider.setDoctors(doctors);
                  if (doctorListProvider.isSearching && _searchController.text.isNotEmpty) {
                    doctors = doctorListProvider.filteredDoctors;
                  }
                  if (doctors.isEmpty) {
                    return Center(child: Text('No doctors found'));
                  }
                  return ListView.builder(
                    itemCount: doctors.length,
                    itemBuilder: (context, index) {
                      DoctorModel doctor = doctors[index];
                      final ImageProvider<Object> doctorImage = doctor.image != null
                          ? NetworkImage(doctor.image!)
                          : AssetImage("assets/user.png") as ImageProvider<Object>;
                      final doctorName = doctor.fullName ?? 'N/A';
                      final doctorCategory = doctor.category ?? 'N/A';
                      final doctorStartTime = doctor.startTime ?? 'N/A';
                      final doctorEndTime = doctor.endTime ?? 'N/A';

                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DoctorProfile(doctor: doctor),
                            ));
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
                                  child: CircleAvatar(
                                    radius: 40,
                                    backgroundImage: doctorImage,
                                  ),
                                ),
                                Positioned(
                                  top: 15,
                                  left: 110,
                                  child: Text(
                                    doctorName,
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
                                    doctorCategory,
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
                                    "$doctorStartTime to $doctorEndTime",
                                    style: GoogleFonts.montserrat(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
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