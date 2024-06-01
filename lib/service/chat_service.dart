import 'dart:developer';
import 'dart:io';
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

  Future<String> uploadImage(File file) async {
    String fileName = 'chat_images/${firebaseAuth.currentUser!.uid}/${DateTime.now().millisecondsSinceEpoch}';
    UploadTask uploadTask = storage.child(fileName).putFile(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<void> sendMessage(MessageModel data) async {
    String chatRoomId = generateChatRoomId(
        uId1: firebaseAuth.currentUser!.uid, uId2: data.receiverId!);
    String messageId =
        data.senderId! + DateTime.now().millisecondsSinceEpoch.toString();
    try {
      await firestore
          .collection(chatCollection)
          .doc(chatRoomId)
          .collection("Messages")
          .doc(messageId)
          .set(data.toJson());
    } catch (e) {
      throw e;
    }
  }

  Future<void> createChat(ChatModel data) async {
    try {
      await firestore
          .collection(chatCollection)
          .doc(data.chatRoomId)
          .set(data.toJson());
      log('chat created');
    } catch (e) {
      throw e;
    }
  }

  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getMessages(String receiverId) async {
    try {
      String chatRoomId = generateChatRoomId(
          uId1: firebaseAuth.currentUser!.uid, uId2: receiverId);
      var snapshot = firestore
          .collection("Chats")
          .doc(chatRoomId)
          .collection('Messages')
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
          .map((DocumentSnapshot doc) => ChatModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      return allChats;
    } catch (e) {
      throw e;
    }
  }
}
