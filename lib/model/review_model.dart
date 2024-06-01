import 'package:cloud_firestore/cloud_firestore.dart';

class ReviewModel {
  String? content;
  String? username;
  String? userPic;
  String? uId;
  String? reviewId;
  String? courseId;
  int? like;
  DateTime? timeStamp;
  ReviewModel(
      {this.content,
      this.courseId,
      this.username,
      this.reviewId,
      this.userPic,
      this.timeStamp,
      this.uId,
      this.like});
  factory ReviewModel.fromJson(json) {
    return ReviewModel(
      uId: json['uId'],
      reviewId: json['reviewId'],
      courseId: json['courseId'],
      content: json['content'],
      like: json['like'],
      timeStamp: json['timeStamp'] != null
          ? (json['timeStamp'] as Timestamp).toDate()
          : null,
    );
  }
  toJson() {
    return {
      'uId': uId,
      'reviewId': reviewId,
      'courseId': courseId,
      'content': content,
      'like': like,
      'timeStamp': timeStamp,
    };
  }
}