import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medic/view/payment_confirm_screen.dart';

class AppoinmentBookigScreen extends StatefulWidget {
  const AppoinmentBookigScreen({Key? key});

  @override
  State<AppoinmentBookigScreen> createState() => _AppoinmentBookigScreenState();
}

class _AppoinmentBookigScreenState extends State<AppoinmentBookigScreen> {
  late DateTime _selectedDate;
  late List<String> _availableTimeSlots;
  int _selectedIndex = -1;

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
      appBar: AppBar(iconTheme: IconThemeData(color: Colors.white),
        backgroundColor:  Color.fromARGB(255, 38, 140, 101),
        centerTitle: true,
        title: Text("Appointment Booking",style: TextStyle(color: Colors.white),),
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
                _selectedIndex = -1; // Reset selected index when date changes
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
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = index;
                          });
                        },
                        child: Container(
                          height: 50,
                          width: 70,
                          decoration: BoxDecoration(
                            color: _selectedIndex == index
                                ? Color.fromARGB(255, 29, 141, 102)
                                : Color.fromARGB(255, 186, 184, 184),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              _availableTimeSlots[index],
                              style: GoogleFonts.montserrat(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: _selectedIndex == index
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => AppoinmentConfirmScreen(),));},
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
