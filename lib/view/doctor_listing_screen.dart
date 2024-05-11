import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medic/view/doctor_profile_screen.dart';

class DoctorListScreen extends StatefulWidget {
  const DoctorListScreen({super.key});

  @override
  State<DoctorListScreen> createState() => _DoctorListScreenState();
}

class _DoctorListScreenState extends State<DoctorListScreen> {
  @override
  bool isSearching =false;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(iconTheme: IconThemeData(color: Colors.white),
        backgroundColor:  Color.fromARGB(255, 122, 182, 159),
      actions: [IconButton(onPressed: (){
        setState(() {
          isSearching=!isSearching;
        });
      }, icon: Icon(Icons.search))],
      ),
      backgroundColor: Color.fromARGB(255, 241, 240, 240),
      body: Column(
        children: [
        if (isSearching) ...[
            Padding(
              padding: const EdgeInsets.only(top:20, left: 20, right: 20),
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
            child:Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 5, right: 5, bottom: 5, top: 5),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => DoctorProfile(),
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
                                      backgroundImage:
                                          AssetImage("assets/doct1.jpeg"),
                                    ),
                                  ),
                                  Positioned(
                                    top: 15,
                                    left: 110,
                                    child: Text(
                                      "Dr. Ward Warren",
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
                                      "Neuro Medicine",
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
                                      "05.00 pm to 10.30 pm",
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
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
