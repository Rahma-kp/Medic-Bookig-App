import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medic/view/userside/appoinment/payment_confirm_screen.dart';

class AppoinmentBookigScreen extends StatefulWidget {
  const AppoinmentBookigScreen({Key? key});

  @override
  State<AppoinmentBookigScreen> createState() => _AppoinmentBookigScreenState();
}

class _AppoinmentBookigScreenState extends State<AppoinmentBookigScreen> {
  late DateTime _selectedDate;
  late List<String> _availableTimeSlots;
  int _selectedIndex = -1;


  List<String> _bookedTimeSlots = [
    '11:00 AM',
    '2:00 PM',
  ];

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
        title: Text(
          "Appointment Booking",
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(bottom: 30, left: 10, right: 10, top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Colors.white,
              elevation: 6,
              child: CalendarDatePicker(
                initialDate: DateTime.now(),
                firstDate: DateTime.now().subtract(Duration(days: 140)),
                lastDate: DateTime.now().add(Duration(days: 30)),
                onDateChanged: (DateTime newDate) {
                  setState(() {
                    _selectedDate = newDate;
                    _updateAvailableTimeSlots(_selectedDate);
                    _selectedIndex = -1;
                  });
                },
              ),
            ),
            SizedBox(
              height: 10,
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
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 2,
                      ),
                      itemBuilder: (context, index) {
                        bool isBooked =
                            _bookedTimeSlots.contains(_availableTimeSlots[index]);
                        return GestureDetector(
                          onTap: () {
                            if (!isBooked) {
                              setState(() {
                                _selectedIndex = index;
                              });
                            }
                          },
                          child: Container(
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                              color: isBooked
                                  ? Colors.red
                                  : _selectedIndex == index
                                      ? Color.fromARGB(255, 122, 182, 159)
                                      : Color.fromARGB(255, 186, 184, 184),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                _availableTimeSlots[index],
                                style: GoogleFonts.montserrat(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: isBooked
                                      ? Colors.white
                                      : _selectedIndex == index
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
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AppoinmentConfirmScreen(),
                        ));
                      },
                      child: Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 122, 182, 159),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Confirm Schedule",
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.italic,
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
      ),
    );
  }
}
