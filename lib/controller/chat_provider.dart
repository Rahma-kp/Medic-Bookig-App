import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medic/model/chat_model.dart';
import 'package:medic/model/doctor_model.dart';
import 'package:medic/model/message_model.dart';
import 'package:medic/service/chat_service.dart';
import 'package:medic/service/doctor_service.dart';
import 'package:medic/view/userside/util/util.dart';


class ChatController extends ChangeNotifier {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  TextEditingController messageController = TextEditingController();
  ChatService chatService = ChatService();
  List<ChatModel>? myAllChat = [];
  final ImagePicker picker =ImagePicker();
  bool isLoading=false;
  
  late ScrollController scrollController;
  List<MessageModel> allMessage = [];

    Future<void> pickAndSendImage(String receiverId) async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      File file = File(image.path);
      String imageUrl = await chatService.uploadImage(file);
      await sendMessage(receiverId, imageUrl: imageUrl);
    }
  }
 


 sendMessage(String receiverId, {String? imageUrl}) async {
    await createChat(receiverId);
    final data = MessageModel(
      senderId: firebaseAuth.currentUser!.uid,
      receiverId: receiverId,
      message: imageUrl ?? messageController.text,
      timeStamp: DateTime.now(),
      type: imageUrl != null ? 'image' : 'text',
    );
    await chatService.sendMessage(data);

    getMessages(receiverId);
    getAllChats();
  }

  getMessages(String receiverId) async {
    allMessage.clear();
    Stream<QuerySnapshot<Map<String, dynamic>>> snapshot =
        await chatService.getMessages(receiverId);
    snapshot.listen((message) {
      allMessage =
          message.docs.map((doc) => MessageModel.fromJson(doc.data())).toList();
          log(allMessage.length.toString());
      notifyListeners();
    });
  }


  // checkChackExist(String receiverId) async {
  //   return await chatService.checkChatExist(receiverId);
  // }

  getAllChats() async {
  isLoading = true;
  notifyListeners();log(myAllChat!.length.toString());

  try {
    List<DoctorModel> allUser = await DoctorService().getAllDoctors();
    List<ChatModel> allChats = await chatService.getAllChats();
    List<ChatModel> filteredChats = [];

    for (var chat in allChats) {
      if (chat.uId1 == firebaseAuth.currentUser!.uid || chat.uId2 == firebaseAuth.currentUser!.uid) {
        DoctorModel? usern = allUser.firstWhere(
          (user) => (user.id == chat.uId1 || user.id == chat.uId2) && user.id != firebaseAuth.currentUser!.uid,
          
        );

        if (usern.id != null) {
    log('message');
          final chatInfo = ChatModel(
            timeStamp: chat.timeStamp,
            lastMessage: chat.lastMessage ?? '',
            userInfo: usern,
          );
          filteredChats.add(chatInfo);
        }
      }
    }
    myAllChat = filteredChats;
  } catch (e) {
    log("Error from Get all chats: ${e.toString()}");
  } finally {
    isLoading = false;
    notifyListeners();
  }
}

  createChat(String receiverId) async {
    String chatRoomId = await generateChatRoomId(
        uId1: firebaseAuth.currentUser!.uid, uId2: receiverId);

    final data = ChatModel(
        uId1: firebaseAuth.currentUser!.uid,
        uId2: receiverId,
        chatRoomId: chatRoomId,
        lastMessage: messageController.text.trim(),
        timeStamp: DateTime.now());
    await chatService.createChat(data);
    // messageController.clear();
    notifyListeners();
  }

  void scrollDown() => WidgetsBinding.instance.addPostFrameCallback((_) {
        if (scrollController.hasClients) {
          scrollController.jumpTo(scrollController.position.maxScrollExtent);
        }
      });


}



