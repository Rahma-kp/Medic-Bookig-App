
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medic/model/chat_model.dart';
import 'package:medic/view/userside/chat/chat_screen.dart';
import 'package:medic/view/userside/home/widget/media_query.dart';
import 'package:medic/widget/custom_text.dart';
import 'package:medic/widget/navigation.dart';

class ChatTileWidget extends StatelessWidget {
  final ChatModel chatModel;
  ChatTileWidget({super.key, required this.chatModel});
  @override
  Widget build(BuildContext context) {
    final DateTime? timestamp = chatModel.timeStamp;
    String formattedTime = DateFormat('hh:mm a').format(timestamp!);
    return ListTile(
      onTap: () {
        NavigatorWidget().push(
            context,
            ChatPage(
              userInfo: chatModel.userInfo!,
            ));
      },
      leading: CircleAvatar(
        backgroundImage: NetworkImage(chatModel.userInfo!.image!),
        radius: MediaQueryWidget().width(context, .06),
      ),
      title: CustomText(
          text: chatModel.userInfo?.fullName! ?? '',
          size: 15,
          textAlign: TextAlign.start),
      subtitle: CustomText(
          text: chatModel.lastMessage!,
          size: 12,
          overflow: true,
          color: Colors.grey[700],
          textAlign: TextAlign.start,
          bold: false),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundColor: Color.fromARGB(255, 22, 127, 113),
            radius: MediaQueryWidget().width(context, .03),
            child: CustomText(
                text: '01',
                color: Colors.white,
                size: 12,
                textAlign: TextAlign.center),
          ),
          CustomText(
              text: formattedTime,
              size: 12,
              bold: false,
              textAlign: TextAlign.center)
        ],
      ),
    );
  }
}