import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medic/controller/chat_provider.dart';
import 'package:medic/model/user_model.dart';
import 'package:medic/view/userside/chat/widget/chat_bottom.dart';
import 'package:medic/view/userside/chat/widget/chat_bubble.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class ChatPage extends StatefulWidget {
  final UserModel userInfo;
  const ChatPage({Key? key, required this.userInfo}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<ChatController>(context, listen: false).scrollController =
        ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    final getChatPrd = Provider.of<ChatController>(context, listen: false);
    getChatPrd.getMessages(widget.userInfo.uId!);

    return Scaffold(
      appBar: AppBar(backgroundColor: Color.fromARGB(255, 29, 141, 102),
          foregroundColor: Colors.white,
          title: Text(widget.userInfo.userName!),
          actions: [
           IconButton(onPressed: (){}, icon: Icon(Icons.call))
          ]),
      body: Column(
        children: [
          Expanded(
            child: Consumer<ChatController>(
              builder: (context, value, child) {
                return ListView.builder(
                  reverse: true,
                  itemCount: value.allMessage.length,
                  itemBuilder: (context, index) {
                    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
                    bool isSender = value.allMessage[index].senderId ==
                        firebaseAuth.currentUser!.uid;
                    DateTime timestamp = value.allMessage[index].timeStamp!;
                    String formattedTime =
                        DateFormat('hh:mm a').format(timestamp);
                    return ChatBubble(
                      isSent: isSender,
                      message: value.allMessage[index].message!,
                      time: formattedTime,
                    );
                  },
                );
              },
            ),
          ),
          ChatBottomBar(
            chatController: getChatPrd,
            userInfo: widget.userInfo,
          ),
        ],
      ),
    );
  }
}