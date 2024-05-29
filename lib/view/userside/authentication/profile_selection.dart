
// import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:medic/controller/authentication_provider.dart';
// import 'package:medic/controller/doctor_provider.dart';
// import 'package:medic/controller/user_provider.dart';
// import 'package:medic/controller/widget_provider.dart';
// import 'package:medic/function/get_all.dart';
// import 'package:medic/view/userside/authentication/widget/signup_widget.dart';
// import 'package:medic/widget/button_widget.dart';
// import 'package:medic/widget/custom_text.dart';
// import 'package:medic/widget/snack.dart';
// import 'package:provider/provider.dart';

// class ProfileSelectionPage extends StatelessWidget {
//   final String loginType;
//   const ProfileSelectionPage({
//     super.key,
//     required this.loginType,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final getWidgetController = Provider.of<WidgetController>(context);
//     return getWidgetController.isLoading
//         ? FlickerLoadingWidget()
//         : Scaffold(
//             body: Padding(
//               padding: const EdgeInsets.all(25.0),
//               child: Align(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         height: 20
//                       ),
//                       CustomText(size: 18, text: 'Select Your Profile'),
//                       CustomText(
//                           size: 13,
//                           bold: false,
//                           textAlign: TextAlign.center,
//                           text:
//                               'Join our educational platform to learn or teach, connecting students with mentors for personalized growth and success'),
//                       SizedBox(
//                         height:20
//                       ),
//                       FullWidthButton(context, text: 'Mentor',
//                           onPressed: () async {
//                         createAccount(context, 'Mentor');
//                       }),
//                       SizedBox(
//                         height:20
//                       ),
//                       FullWidthButton(context, text: 'Student',
//                           onPressed: () async {
//                         createAccount(context, 'Student');
//                       }),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//   }

//   createAccount(context, String profile) async {
//     final getUserController =
//         Provider.of<UserController>(context, listen: false);
//     final getAuthController =
//         Provider.of<AuthController>(context, listen: false);
//     final getWidgetController =
//         Provider.of<WidgetController>(context, listen: false);
//     // final getCourseController =
//     //     Provider.of<CourseController>(context, listen: false);
//     final getmentorContorller =
//         Provider.of<DoctorController>(context, listen: false);

//     try {
//       await getWidgetController.showCircleIndicator(true);
//       late final user;
//       if (loginType == 'Email') {
//         user = await getAuthController.signUpWithEmail(
//           profile,
//         );

//         // final user = await FirebaseAuth.instance.currentUser;
//         // await getUserController.createUser(UserModel(
//         //     username: getAuthController.usernameController.text.trim(),
//         //     email: getAuthController.emailController.text.trim().toLowerCase(),
//         //     profile: profile,
//         //     uId: user!.uid));
//       } else if (loginType == 'Google') {
//         user = await getAuthController.signInWithGoogle(profile: profile);
//         // final user = await FirebaseAuth.instance.currentUser;
//         // await getUserController.createUser(UserModel(
//         //     username: user?.displayName ?? '',
//         //     email: user?.email ?? '',
//         //     profile: profile,
//         //     phone: user?.phoneNumber,
//         //     profilePic: user?.photoURL ?? null,
//         //     uId: user!.uid));
//       }
//       if (user is FirebaseException) {
//         PopUpWidgets().showAwesomeSnackbar(
//           context,
//           'Oops!',
//           '${user.message}',
//           contentType: ContentType.failure,
//         );
//         await getWidgetController.showCircleIndicator(false);
//         Navigator.pop(context);
//         return null;
//       } else {
//         await getWidgetController.showCircleIndicator(false);
//         SignUpWidgets().accountCreatedBox(context);
//         // await getUserController.getCurrentUser();
//         // await getCourseController.getAllCourses();
//         await fetchAllDatas(context);
//         // await getCourseController.getAllFunction(
//         //     mentorContorller: getmentorContorller,
//         //     userController: getUserController);
//         await Future.delayed(Duration(seconds: 2));

//         Navigator.pop(context);
//         NavigatorWidget().pushAndRemoveUntil(context, Bo());
//         PopUpWidgets().showAwesomeSnackbar(
//           context,
//           'Congratulations ${getAuthController.usernameController.text}..!',
//           'You are Account is Created. Get ready to explore and enjoy!',
//           contentType: ContentType.success,
//         );
//         getAuthController.clearControllers();
//       }
//     } on FirebaseAuthException catch (e) {
//       await getWidgetController.showCircleIndicator(false);

//       PopUpWidgets().showAwesomeSnackbar(
//         context,
//         'Oops!',
//         '${e.message}',
//         contentType: ContentType.failure,
//       );
//     }
//   }
// }