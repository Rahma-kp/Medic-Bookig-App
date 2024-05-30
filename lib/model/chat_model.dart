import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medic/model/doctor_model.dart';

class ChatModel {
  String? uId1;
  String? chatRoomId;
  String? uId2;
  String? lastMessage;
  DoctorModel ? userInfo;
  DateTime? timeStamp;

  ChatModel({
    this.uId1,
    this.uId2,
    this.userInfo,
    this.lastMessage,
    this.chatRoomId,
    this.timeStamp,
  });

  factory ChatModel.fromJson(json) {
    return ChatModel(
      uId1: json['uId1'],
      lastMessage: json['lastMessage'],
      chatRoomId: json['chatRoomId'],
      uId2: json['uId2'],
      timeStamp: json['timeStamp'] != null
          ? (json['timeStamp'] as Timestamp).toDate()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uId1': uId1,
      'uId2': uId2,
      'lastMessage': lastMessage,
      'chatRoomId': chatRoomId,
      'timeStamp': timeStamp,
    };
  }
}