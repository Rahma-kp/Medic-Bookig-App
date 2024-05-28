import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medic/model/chat_model.dart';
import 'package:medic/model/message_model.dart';
import 'package:medic/model/user_model.dart';
import 'package:medic/service/chat_service.dart';
import 'package:medic/service/firestore_service.dart';
import 'package:medic/view/userside/util/util.dart';


class ChatController extends ChangeNotifier {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  TextEditingController messageController = TextEditingController();
  ChatService chatService = ChatService();
  List<ChatModel>? myAllChat = [];
  bool isLoading=false;
  

  // List<MessageModel> allChats = [];
  // checkChatExist(String uId2) {
  //   return chatService.checkChatExist(uId2);
  // }
  late ScrollController scrollController;
  List<MessageModel> allMessage = [];
 


  sendMessage(String receiverId) async {
    await createChat(receiverId);
    final data = MessageModel(
        senderId: firebaseAuth.currentUser!.uid,
        receiverId: receiverId,
        message: messageController.text,
        timeStamp: DateTime.now());
    await chatService.sendMessage(data);

    // getMessages(receiverId);
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
  // getMessages(String receiverId) async {
  //   Stream<QuerySnapshot<Map<String, dynamic>>> snapshot =
  //       await chatService.getMessages(receiverId);
  //   snapshot.listen((message) {
  //     List<MessageModel> newMessages =
  //         message.docs.map((doc) => MessageModel.fromJson(doc.data())).toList();

  //     allMessage.;
  //     notifyListeners();
  //   });
  // }

  // checkChackExist(String receiverId) async {
  //   return await chatService.checkChatExist(receiverId);
  // }

  getAllChats() async {
  isLoading = true;
  notifyListeners();

  try {
    List<UserModel> allUser = await FireStoreService().getAllUser();
    List<ChatModel> allChats = await chatService.getAllChats();
    List<ChatModel> filteredChats = [];

    for (var chat in allChats) {
      if (chat.uId1 == firebaseAuth.currentUser!.uid || chat.uId2 == firebaseAuth.currentUser!.uid) {
        UserModel? user = allUser.firstWhere(
          (user) => (user.uId == chat.uId1 || user.uId == chat.uId2) && user.uId != firebaseAuth.currentUser!.uid,
          orElse: () => UserModel()
        );

        if (user.uId != null) {
          final chatInfo = ChatModel(
            timeStamp: chat.timeStamp,
            lastMessage: chat.lastMessage ?? '',
            userInfo: user,
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