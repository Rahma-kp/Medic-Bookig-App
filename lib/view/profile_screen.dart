import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medic/widget/setting_drop_down.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 500,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 33, 186, 127),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50))),
          ),
          Positioned(right: 0,top: 20,
            child: IconButton(onPressed: (){
              DropDownSettings();
            }, icon: Icon(Icons.more_vert_outlined,color: Colors.white,))),
            // DropDownSettings(),
          Positioned(top: 150,left: 120,
            child: CircleAvatar(radius: 70,))
        ],
      ),
    );
  }
}
