import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppoinmentScreen extends StatefulWidget {
  const AppoinmentScreen({Key? key});

  @override
  State<AppoinmentScreen> createState() => _AppoinmentScreenState();
}

class _AppoinmentScreenState extends State<AppoinmentScreen> {
  late DateTime _selectedDate;
  late List<String> _availableTimeSlots;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _updateAvailableTimeSlots(_selectedDate);
  }

  void _updateAvailableTimeSlots(DateTime selectedDate) {
    _availableTimeSlots = [
      '10:00 AM',
      '11:00 AM',
      '2:00 PM',
      '3:00 PM',
      '4:00 PM',
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Appointment Booking"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CalendarDatePicker(
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(Duration(days: 140)),
            lastDate: DateTime.now().add(Duration(days: 30)),
            onDateChanged: (DateTime newDate) {
              setState(() {
                _selectedDate = newDate;
                _updateAvailableTimeSlots(_selectedDate); 
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              "Available Time",
              style: GoogleFonts.montserrat(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.all(10),
                    itemCount: _availableTimeSlots.length,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 100,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        height: 50,
                        width: 70,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 186, 184, 184),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            _availableTimeSlots[index],
                            style: GoogleFonts.montserrat(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              
                Center(
                  child: GestureDetector(onTap: (){},
                    child: Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 29, 141, 102),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "Confirm Schedule",
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
