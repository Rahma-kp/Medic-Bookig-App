// import 'package:flutter/material.dart';

// class DropDownSettings extends StatefulWidget {
//   @override
//   _DropDownSettingsState createState() => _DropDownSettingsState();
// }

// class _DropDownSettingsState extends State<DropDownSettings> {
//   String selectedItem = 'Settings'; 

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: DropdownButton<String>(
//         value: selectedItem,
//         onChanged: (String? newValue) {
//           if (newValue != null) {
//             setState(() {
//               selectedItem = newValue;
//             });
//           }
//         },
//         items: <String>['Settings'].map((String value) {
//           return DropdownMenuItem<String>(
//             value: value,
//             child: Text(value),
//           );
//         }).toList(),
//       ),
//     );
//   }
// }
