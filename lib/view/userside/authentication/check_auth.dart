// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:medic/controller/user_provider.dart';
// import 'package:medic/function/get_all.dart';
// import 'package:medic/view/userside/authentication/profile_selection.dart';
// import 'package:medic/widget/bottom_bar.dart';
// import 'package:medic/widget/navigation.dart';
// import 'package:medic/widget/snack.dart';
// import 'package:provider/provider.dart';

// class CheckGoogleLogin extends StatefulWidget {
//   const CheckGoogleLogin({super.key});

//   @override
//   State<CheckGoogleLogin> createState() => _CheckGoogleLoginState();
// }

// class _CheckGoogleLoginState extends State<CheckGoogleLogin> {
//   @override
//   void initState() {
//     checkFuntion();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FlickerLoadingWidget();
//   }

//   checkFuntion() async {
//     try {
//       final getUserController =
//           Provider.of<UserController>(context, listen: false);
//       // final getCourseController =
//       //     Provider.of<CourseController>(context, listen: false);
//       // final getmentorContorller =
//       //     Provider.of<MentorContorller>(context, listen: false);

//       // final user = await FirebaseAuth.instance.currentUser;
//       // await getCourseController.getAllFunction(
//       //     mentorContorller: getmentorContorller,
//       //     userController: getUserController);
//       // final userId = await getUserController.allUsers
//       //     ?.firstWhere((element) => element.uId == user?.uid);
//       await getUserController.getCurrentUser();
//       final user = getUserController.currentUser;
//     //   if (user != null) {
//     //     await fetchAllDatas(context);
//     //     NavigatorWidget().pushReplacement(context,  BottomNavigation(selectedIndex: 0),);
//     //   } else {
//     //     NavigatorWidget().pushReplacement(
//     //       context,
//     //       ProfileSelectionPage(loginType: 'Google'),
//     //     );
//     //   }
//     // } catch (e) {
//     //   NavigatorWidget().pushReplacement(
//     //     context,
//     //     ProfileSelectionPage(loginType: 'Google'),
//     //   );
//     // }
//   // }
// }