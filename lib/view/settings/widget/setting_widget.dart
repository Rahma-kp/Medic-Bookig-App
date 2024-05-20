import 'package:flutter/material.dart';

class SettingWidget extends StatelessWidget {
  final String txt;
  final double top, left;
  final IconData iconData;
  final Widget Function(BuildContext) navigatorBuilder; 

  const SettingWidget({
    Key? key,
    required this.txt,
    required this.top,
    required this.left,
    required this.iconData,
    required this.navigatorBuilder, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => navigatorBuilder(context), 
          ));
        },
        child: Row(
          children: [
            Icon(
              iconData,
              size: 40,
              color: Colors.white,
            ),
            SizedBox(width: 20),
            Text(
              txt,
              style: TextStyle(color: Colors.white, fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
