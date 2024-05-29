
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:medic/view/userside/home/widget/media_query.dart';
import 'package:medic/widget/color_widget.dart';
import 'package:medic/widget/custom_text.dart';
import 'package:medic/widget/icon_widget.dart';

class ButtonWidget {
  // Widget outlinedButton({
  //   required String text,
  //   required VoidCallback onPressed,
  //   Color color = Colors.blue,
  //   Color textColor = Colors.black,
  // }) {
  //   return OutlinedButton(
  //     onPressed: onPressed,
  //     style: OutlinedButton.styleFrom(
  //       side: BorderSide(color: color),
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(8.0),
  //       ),
  //     ),
  //     child: Text(
  //       text,
  //       style: TextStyle(color: textColor),
  //     ),
  //   );
  // }
}

class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget({
    super.key,
    required this.context,
    required this.text,
    required this.onPressed,
    required this.color,
    required this.bold,
  });

  final BuildContext context;
  final String text;
  final VoidCallback? onPressed;
  final Color? color;
  final bool bold;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onPressed;
      },
      child: Text(
        text,
        textAlign: TextAlign.left,
        style: GoogleFonts.montserrat(
          color: color ?? Colors.black,
          fontSize: MediaQuery.of(context).size.width * 0.035,
          fontWeight: bold ? FontWeight.bold : FontWeight.w500,
        ),
      ),
    );
  }
}

class FullWidthButton extends StatelessWidget {
  const FullWidthButton(
    context, {
    // required BuildContext ,
    required this.text,
    required this.onPressed,
    this.textColor = Colors.white,
  });
  final String text;
  final VoidCallback onPressed;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Material(
        shadowColor: Color.fromARGB(160, 0, 0, 0),
        elevation: 10,
        borderRadius: BorderRadius.circular(
          MediaQueryWidget().width(context, .05),
        ),
        child: Container(
            decoration: BoxDecoration(
              gradient: ColorsWidget().linergradientColor(),
              borderRadius: BorderRadius.circular(
                MediaQueryWidget().width(context, .05),
              ),
            ),
            height: MediaQueryWidget().height(context, .09),
            width: double.infinity,
            child: Center(
                child: CustomText(
              bold: true,
              color: textColor,
              text: text,
            ))),
      ),
    );
  }
}

class FullWidthBlankButton extends StatelessWidget {
  const FullWidthBlankButton(context,
      {
      // required BuildContext ,
      required this.text,
      required this.onPressed,
      this.textColor = Colors.black,
      this.buttonColor = const Color.fromARGB(255, 255, 255, 255),
      this.isGradient = false,
      this.textSize = 15});

  final String text;
  final VoidCallback onPressed;
  final Color? textColor;
  final Color? buttonColor;
  final bool? isGradient;
  final double? textSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          decoration: BoxDecoration(
              gradient:
                  isGradient! ? ColorsWidget().linergradientColor() : null,
              color: buttonColor,
              borderRadius: BorderRadius.all(Radius.circular(100))),
          height: MediaQueryWidget().width(context, .16),
          width: double.infinity,
          child: Center(
              child: CustomText(
            size: textSize!,
            color: textColor,
            bold: true,
            text: text,
          ))),
    );
  }
}

class FullWidthButtonWithArrow extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? textColor;
  final Alignment? textalignment;
  final double? textSize;
  const FullWidthButtonWithArrow(context,
      {required this.text,
      required this.onPressed,
      this.textColor = Colors.white,
      this.textalignment = Alignment.center,
      this.textSize = 18});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        children: [
          Material(
            shadowColor: Color.fromARGB(160, 0, 0, 0),
            elevation: 10,
            borderRadius: BorderRadius.circular(
              MediaQueryWidget().width(context, 8),
            ),
            child: Container(
                decoration: BoxDecoration(
                    gradient: ColorsWidget().linergradientColor(),
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                height: MediaQueryWidget().width(context, .16),
                width: double.infinity,
                child: Align(
                    alignment: textalignment!,
                    child: Padding(
                      padding: EdgeInsets.all(
                          MediaQueryWidget().width(context, .03)),
                      child: CustomText(
                        size: textSize!,
                        color: Colors.white,
                        bold: true,
                        text: text,
                      ),
                    ))),
          ),
          Positioned(
            right: 6,
            top: 1,
            bottom: 1,
            child: CircleAvatar(
              child: IconWidget(context, iconData:Icons.arrow_downward),
              radius: MediaQueryWidget().height(context, .03),
              backgroundColor: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}