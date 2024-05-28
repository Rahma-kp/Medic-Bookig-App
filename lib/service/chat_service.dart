import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:medic/model/chat_model.dart';
import 'package:medic/model/message_model.dart';
import 'package:medic/view/userside/util/util.dart';


class ChatService {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  String chatCollection = 'Chats';
  Reference storage = FirebaseStorage.instance.ref();

  sendMessage(MessageModel data) async {
    String chatRoomId = generateChatRoomId(
        uId1: firebaseAuth.currentUser!.uid, uId2: data.receiverId!);
    String senderId =
        data.senderId! + DateTime.now().millisecondsSinceEpoch.toString();
    try {
      await firestore
          .collection(chatCollection)
          .doc(chatRoomId)
          .collection("Messeges")
          .doc(senderId)
          .set(data.toJson());
    } catch (e) {
      throw e;
    }
    ;
  }

  createChat(ChatModel data) async {
    try {
      await firestore
          .collection(chatCollection)
          .doc(data.chatRoomId)
          .set(data.toJson());
      log('chat created');
    } catch (e) {
      throw e;
    }
    ;
  }

  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getMessages(
      String receiverId) async {
    try {
      String chatRoomId = generateChatRoomId(
          uId1: firebaseAuth.currentUser!.uid, uId2: receiverId);
      var snapshot = await firestore
          .collection("Chats")
          .doc(chatRoomId)
          .collection('Messeges')
          .orderBy('timeStamp', descending: true)
          .snapshots();

      return snapshot;
    } catch (e) {
      throw e;
    }
  }

  Future<List<ChatModel>> getAllChats() async {
    try {
      final QuerySnapshot snapshot = await firestore
          .collection(chatCollection)
          .orderBy('timeStamp', descending: true)
          .get();

      List<ChatModel> allChats = snapshot.docs
          .map((DocumentSnapshot doc) => ChatModel.fromJson(doc.data()))
          .toList();

      return allChats;
    } catch (e) {
      throw e;
    }
  }
 

  // checkChatExist(String receiverId) async {
  //   try {
  //     String chatRoomId = generateChatRoomId(
  //         uId1: firebaseAuth.currentUser!.uid, uId2: receiverId);

  //     final snapshot =
  //         await firestore.collection(chatCollection).doc(chatRoomId).get();
  //     final result = ChatModel.fromJson(snapshot.data());
  //     if (result.chatRoomId != null) {
  //       return true;
  //     }
  //     return false;
  //   } catch (e) {}
  // }
}