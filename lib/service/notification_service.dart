import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final notification = FlutterLocalNotificationsPlugin();
  static init() {
    notification.initialize(InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
    ));
  }

  pushNotification({required String title, required String body}) async {
    var androidDetails = AndroidNotificationDetails(
        'importent channel', 'My Channel',
        importance: Importance.max, priority: Priority.high);
    var notificationDetails = NotificationDetails(android: androidDetails);
    await notification.show(100, title, body, notificationDetails);
    log("message from service");
  }

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
}