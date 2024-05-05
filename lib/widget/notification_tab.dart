import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int selectedIndex = 0;

  void selectTab(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 10),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 147, 143, 143),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomTab(
              text: 'Booking',
              isSelected: selectedIndex == 0,
              onTap: () => selectTab(0),
            ),
            CustomTab(
              text: 'Upcoming',
              isSelected: selectedIndex == 1,
              onTap: () => selectTab(1),
            ),
            CustomTab(
              text: 'Canceled',
              isSelected: selectedIndex == 2,
              onTap: () => selectTab(2),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTab extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomTab({
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? Color.fromARGB(255, 95, 146, 69) : const Color.fromARGB(255, 147, 143, 143), 
            borderRadius: BorderRadius.circular(20)),
          child: Text(
            text,
            style: TextStyle(
              // backgroundColor:  isSelected ? Color.fromARGB(255, 95, 146, 69) : const Color.fromARGB(255, 147, 143, 143), 
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.white : Colors.black, 
            ),
          ),
        ),
      ),
    );
  }
}
