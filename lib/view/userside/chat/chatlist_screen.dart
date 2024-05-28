
import 'package:flutter/material.dart';
import 'package:medic/controller/chat_provider.dart';
import 'package:medic/view/userside/chat/widget/chat_tile.dart';
import 'package:medic/widget/custom_text.dart';

import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    Provider.of<ChatController>(context, listen: false).getAllChats();
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'Inbox',
          size: 20,
        ),
        actions: [
         
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: Column(
          children: [
            SizedBox(
              height:20
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                      8),
                ),
                child:
                    Consumer<ChatController>(builder: (context, value, child) {
                  return ListView.separated(
                    itemBuilder: (context, index) {
                      return ChatTileWidget(
                        chatModel: value.myAllChat[index],
                        // userModel: value.myAllChat[index].userInfo!,
                      );
                    },
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: value.myAllChat.length,
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}