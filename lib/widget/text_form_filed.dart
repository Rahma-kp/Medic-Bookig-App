import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final bool? obscureText;
  final int? maxLines;
  final double? width;
  final String? suffixText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? validateMessage;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final OutlineInputBorder? enabledBorder;
  final OutlineInputBorder? focusedBorder;
  final OutlineInputBorder? focusErrorBorder;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextFormField({
    super.key,
    this.hintText,
    this.labelText,
    this.obscureText,
    this.maxLines,
    this.width,
    this.suffixText,
    this.prefixIcon,
    this.suffixIcon,
    this.validateMessage,
    this.keyboardType,
    required this.controller,
    this.enabledBorder,
    this.focusedBorder,
    this.focusErrorBorder,
    this.inputFormatters,
  });

  static final RegExp emailRegex = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validateMessage ?? 'Enter value';
        } else if (keyboardType == TextInputType.emailAddress &&
            !emailRegex.hasMatch(value)) {
          return 'Enter a valid email address';
        } else if (keyboardType == TextInputType.datetime &&
            !emailRegex.hasMatch(value)) {
          return 'Enter a valid datetime';
        } else {
          return null;
        }
      },
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      controller: controller,
      maxLines: maxLines ?? 1,
      decoration: InputDecoration(
        suffixText: suffixText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hintText: hintText,
        hintStyle: GoogleFonts.inter(
          color: const Color(0xFF98A3B3),
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
        labelText: labelText,
        labelStyle: GoogleFonts.inter(
          color: const Color(0xFF98A3B3),
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
        fillColor: const Color.fromARGB(255, 225, 227, 234),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,
        focusedErrorBorder: focusErrorBorder,
      ),
    );
  }
}

Widget dropDownTextFormField(
    {validateMessage, value, items, onChanged, hintText}) {
  return DropdownButtonFormField<String>(
    icon: const SizedBox.shrink(),
    validator: (value) {
      if (value == null) {
        return validateMessage;
      } else {
        return null;
      }
    },
    value: value,
    items: items,
    onChanged: onChanged,
    decoration: InputDecoration(
      suffixIcon: const Icon(EneftyIcons.arrow_down_outline),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide.none,
      ),
      filled: true,
      fillColor: const Color.fromARGB(255, 225, 227, 234),
      hintText: hintText,
      hintStyle: GoogleFonts.inter(
        color: const Color(0xFF98A3B3),
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
    ),
  );
}


class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.text,
    this.color,
    this.textAlign = TextAlign.center,
    this.bold = true,
    this.overflow = false,
    this.size = 15,
  }) : super(key: key);

  final String text;
  final TextAlign textAlign;
  final Color? color;
  final bool bold;
  final bool overflow;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: overflow ? 1 : null,
      overflow: overflow ? TextOverflow.ellipsis : null,
      style: GoogleFonts.ubuntu(
        color: color ?? Colors.black,
        fontSize: size,
        fontWeight: bold ? FontWeight.w800 : FontWeight.w500,
      ),
    );
  }
}