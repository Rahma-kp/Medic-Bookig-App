import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medic/model/notification_model.dart';
import 'package:medic/model/user_model.dart';
import 'package:medic/service/firestore_service.dart';


class NotificationController extends ChangeNotifier {
// Initialize FlutterLocalNotificationsPlugin

  FireStoreService fireStoreService = FireStoreService();
  final user = FirebaseAuth.instance.currentUser;
  List<NotificationModel> allNotification = [];
  DateTime? latestNotificationTime;
  Map<String, List<NotificationModel>> notificationsBySender = {};

  // sendMessageNotification(
  //     {String? content, String? title, String? receiverId}) async {
  //   final data = NotificationModel(
  //       content: content,
  //       id: user!.uid + DateTime.now().toString(),
  //       receiverId: receiverId,
  //       senderId: user!.uid,
  //       type: NotificationType.chat,
  //       timeStamp: DateTime.now(),
  //       title: title);
  //   return await fireStoreService.sendNotification(data);
  //  }

  // sendReviewNotification(
  //     {String? content, String? courseName, required String uid}) async {
  //   UserModel? usr = await fireStoreService.getCurrentUser();

  //   final data = NotificationModel(
  //       content:
  //           " ${usr.firstname} has added a review on your ${usr.lastname} course.",
  //       id: user!.uid + DateTime.now().toString(),
  //       receiverId: uid,
  //       senderId: user!.uid,
  //       type: NotificationType.review,
  //       timeStamp: DateTime.now(),
  //       title: usr.userName);

  //   await fireStoreService.sendNotification(data);
  // }

  // sendNotificationToFollowers({String? courseName}) async {
  //   UserModel? usr = await fireStoreService.getCurrentUser();
  //   List followers = usr.followers!;
  //   for (var item in followers) {
  //     log(item);
  //     final data = NotificationModel(
  //         content: "${usr.firstname} has uploaded a new course: ${courseName}.",
  //         id: user!.uid + DateTime.now().toString(),
  //         receiverId: item,
  //         senderId: user!.uid,
  //         type: NotificationType.course,
  //         timeStamp: DateTime.now(),
  //         title: usr.firstname);

  //     await fireStoreService.sendNotification(data);
  //   }
  // }
  // Function to show a local notification

  // deleteNotification(context, String id) async {
  //   await fireStoreService.deleteNotification(id);
  //   filterAndGroupNotifications(context);
  //   // notifyListeners();
  // }

  // getNotifications(BuildContext context) async {
  //   Stream<QuerySnapshot<Map<String, dynamic>>> snapshot =
  //       await fireStoreService.getNotifications();
  //   snapshot.listen((message) {
  //     final newNotifications = message.docs
  //         .map((doc) => NotificationModel.fromJson(doc.data()))
  //         .toList();

  //     if (newNotifications.isNotEmpty) {
  //       final latestTime = newNotifications[0].timeStamp;
  //       if (latestNotificationTime == null ||
  //           latestTime!.isAfter(latestNotificationTime!)) {
  //         latestNotificationTime = latestTime;
  //         // PopupWidgets.showDelightToastBarNotification(context,
  //         //     title: newNotifications[0].title!, toastItem: ToastItem.success);
  //       }
  //     }

  //     allNotification.clear();
  //     allNotification.addAll(newNotifications);
  //     notifyListeners();
  //   });
  // }

//   filterAndGroupNotifications(BuildContext context) {
//     getNotifications(context);
//     notificationsBySender.clear();
//     for (var notification in allNotification) {
//       DateTime timestamp = notification.timeStamp!;
//       String formattedTime = DateFormat('hh:mm a').format(timestamp);

//       if (!notificationsBySender.containsKey(formattedTime)) {
//         notificationsBySender[formattedTime] = [];
//       }
//       notificationsBySender[formattedTime]!.add(notification);
//     }
//     // notifyListeners();
//   }
 }