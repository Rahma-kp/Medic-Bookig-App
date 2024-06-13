import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medic/model/doctor_model.dart';
import 'package:medic/view/userside/appoinment/payment_confirm_screen.dart';
import 'package:medic/view/userside/appoinment/widget/genrate_time_slote.dart';

class AppoinmentBookingScreen extends StatefulWidget {
  final DoctorModel doctor;

  const AppoinmentBookingScreen({Key? key, required this.doctor}) : super(key: key);

  @override
  State<AppoinmentBookingScreen> createState() => _AppoinmentBookingScreenState();
}

class _AppoinmentBookingScreenState extends State<AppoinmentBookingScreen> {
  late List<String> availableTimeSlots;
  List<String> _bookedTimeSlots = [];
  int _selectedIndex = -1;
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _updateAvailableTimeSlots(_selectedDate);
  }

  void _updateAvailableTimeSlots(DateTime? selectedDate) {
    setState(() {
      // Update available time slots based on the selected date
      availableTimeSlots = generateTimeSlots(
        widget.doctor.startTime!.trim(),
        widget.doctor.endTime!.trim()
      );

      // Here you can add the logic to fetch booked time slots for the selected date
      // For demonstration, we're using dummy booked time slots
      _bookedTimeSlots = ['10:30 AM', '11:00 AM'];
    });
  }

  void _onTimeSlotSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Appointment Booking"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 30, left: 10, right: 10, top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Colors.white,
              elevation: 6,
              child: CalendarDatePicker(
                initialDate: _selectedDate!,
                firstDate: DateTime.now().subtract(const Duration(days: 140)),
                lastDate: DateTime.now().add(const Duration(days: 30)),
                onDateChanged: (DateTime newDate) {
                  setState(() {
                    _selectedDate = newDate;
                    _updateAvailableTimeSlots(_selectedDate);
                    _selectedIndex = -1;
                  });
                },
              ),
            ),
            const SizedBox(height: 10),
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
                      padding: const EdgeInsets.all(10),
                      itemCount: availableTimeSlots.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 2,
                      ),
                      itemBuilder: (context, index) {
                        bool isBooked = _bookedTimeSlots.contains(availableTimeSlots[index]);
                        return GestureDetector(
                          onTap: () {
                            if (!isBooked) {
                              _onTimeSlotSelected(index);
                            }
                          },
                          child: Container(
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                              color: isBooked
                                  ? Colors.red
                                  : _selectedIndex == index
                                      ? const Color.fromARGB(255, 122, 182, 159)
                                      : const Color.fromARGB(255, 186, 184, 184),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                availableTimeSlots[index],
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
                        if (_selectedIndex != -1 && !_bookedTimeSlots.contains(availableTimeSlots[_selectedIndex])) {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AppoinmentConfirmScreen(
                              selectedDate: _selectedDate!,
                              selectedTimeSlot: availableTimeSlots[_selectedIndex],
                               doctor: widget.doctor,
                            ),
                          ));
                        } else {
                          print("Please select a valid time slot");
                        }
                      },
                      child: Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 71, 153, 124),
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
