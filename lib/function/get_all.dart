import 'dart:developer';


import 'package:medic/controller/doctor_provider.dart';
import 'package:medic/controller/user_provider.dart';
import 'package:provider/provider.dart';

fetchAllDatas(context) async {
  final getUserController = Provider.of<UserController>(context, listen: false);
  // final getCourseController =
  //     Provider.of<CourseController>(context, listen: false);
  final getmentorContorller =
      Provider.of<DoctorController>(context, listen: false);
  // final notification =
  //     Provider.of<NotificationController>(context, listen: false);

  await getUserController.getAllUser();
  await getUserController.getCurrentUser();
  // await getCourseController.getAllCourses();
  // await getmentorContorller.getAllMentors();
  // await notification.getNotifications(context);

  log('Fetched All Datas');
}