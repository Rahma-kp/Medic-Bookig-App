
import 'package:flutter/material.dart';
import 'package:medic/view/userside/home/widget/media_query.dart';
import 'package:medic/widget/text_form_filed.dart';
import 'package:medic/widget/text_widget.dart';

class ChatBubble extends StatelessWidget {
  final bool isSent;
  final String message;
  final String time;

  const ChatBubble({
    Key? key,
    required this.isSent,
    required this.message,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: MediaQueryWidget().width(context, .03),
          top: MediaQueryWidget().width(context, .03),
          left: isSent
              ? MediaQueryWidget().width(context, .15)
              : MediaQueryWidget().width(context, .03),
          right: isSent
              ? MediaQueryWidget().width(context, .03)
              : MediaQueryWidget().width(context, .15)),
      child: Align(
        alignment: isSent ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          padding: EdgeInsets.all(MediaQueryWidget().width(context, .03)),
          decoration: BoxDecoration(
            color: isSent
                ? Color.fromARGB(255, 188, 223, 238)
                : Color.fromARGB(255, 76, 147, 94),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(MediaQueryWidget().width(context, .045)),
              topRight:
                  Radius.circular(MediaQueryWidget().width(context, .045)),
              bottomLeft: isSent
                  ? Radius.circular(MediaQueryWidget().width(context, .045))
                  : Radius.circular(MediaQueryWidget().width(context, .01)),
              bottomRight: isSent
                  ? Radius.circular(MediaQueryWidget().width(context, .01))
                  : Radius.circular(MediaQueryWidget().width(context, .045)),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              costumParagraphText(context,
                  text: message,
                  bold: false,
                  trimLength: 300,
                  textAlign: TextAlign.justify,
                  color: isSent ? Colors.black : Colors.white),
              SizedBox(height: MediaQueryWidget().width(context, .02)),
              CustomText( 
                  text: time,
                  bold: false,
                  size: 13,
                  textAlign: TextAlign.right,
                  color: isSent ? Colors.black : Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}