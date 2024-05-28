
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medic/controller/chat_provider.dart';
import 'package:medic/controller/notification_contoller.dart';
import 'package:medic/model/user_model.dart';
import 'package:medic/view/userside/home/widget/media_query.dart';
import 'package:provider/provider.dart';

class ChatBottomBar extends StatelessWidget {
  final ChatController chatController;
  final UserModel userInfo;
  const ChatBottomBar({
    super.key,
    required this.chatController,
    required this.userInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQueryWidget().width(context, 0.052)),
      child: SizedBox(
        height: MediaQueryWidget().width(context, 0.2),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: chatController.messageController,
                // onTap: () => showBottomSheet(
                //     context: context,
                //     builder: (context) => ShowReviewList(
                //         getReviewPrd: getReviewPrd,
                //         courseDetails: courseDetails)),
                // controller: getReviewPrd.reviewController,
                decoration: InputDecoration(
                    hintText: 'Type Something',
                    hintStyle: GoogleFonts.ubuntu(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: MediaQueryWidget().width(context, .03)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            MediaQueryWidget().width(context, 0.1))),
                    suffixIcon: IconButton(icon: Icon(Icons.send),
                        onPressed: () async {
                      if (chatController.messageController.text.isNotEmpty) {
                        await chatController.sendMessage(userInfo.uId!);
                        final getUserPrd =
                            Provider.of<User>(context, listen: false);
                        // await Provider.of<NotificationController>(context,
                        //         listen: false)
                        //     .sendMessageNotification(
                        //         content: chatController.messageController.text
                        //             .trim(),
                        //         receiverId: userInfo.uId!,
                        //         title: getUserPrd.currentUser!.userName);

                        chatController.messageController.clear();
                        print('Message send');
                      }
                    },
                    ),
              ),
            ),
        )],
        ),
      ),
    );
  }
}