
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class editingTextForm extends StatelessWidget {
  final String hintxt, labletxt;

  const editingTextForm({
    super.key,
    required this.size,
    required this.userNameController,
    required this.labletxt,
    required this.hintxt,
  });

  final Size size;
  final TextEditingController userNameController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labletxt,
            style: GoogleFonts.aBeeZee(
                fontSize: size.width * 0.05, fontWeight: FontWeight.bold),
          ),
          TextFormField(
            controller: userNameController,
            decoration: InputDecoration(
                hintText: hintxt,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
        ],
      ),
    );
  }
}
