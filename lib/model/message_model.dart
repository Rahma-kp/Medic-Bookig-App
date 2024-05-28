import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  String? senderId;
  String? receiverId;
  String? message;
  DateTime? timeStamp;

  MessageModel({
    required this.senderId,
    required this.receiverId,
    required this.message,
    required this.timeStamp,
  });

  factory MessageModel.fromJson(json) {
    return MessageModel(
      senderId: json['senderId'],
      receiverId: json['receiverId'],
      message: json['message'],
      timeStamp: json['timeStamp'] != null
          ? (json['timeStamp'] as Timestamp).toDate()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'senderId': senderId,
      'receiverId': receiverId,
      'message': message,
      'timeStamp': timeStamp,
    };
  }
}