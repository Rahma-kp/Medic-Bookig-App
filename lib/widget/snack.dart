
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:delightful_toast/toast/utils/enums.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:medic/helpes/tost_bar.dart';

import 'package:medic/view/userside/home/widget/media_query.dart';
import 'package:medic/widget/color_widget.dart';
import 'package:medic/widget/custom_text.dart';
import 'package:medic/widget/icon_widget.dart';
import 'package:medic/widget/navigation.dart';
import 'package:medic/widget/text_widget.dart';

class PopUpWidgets {
  void showSnackbar(BuildContext context, String message,
      {bool isSuccess = true}) {
    final snackbar = SnackBar(
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(MediaQueryWidget().width(context, .03))),
      content: CustomText(text: message, size: 15, color: Colors.white),
      duration: const Duration(seconds: 3),
      backgroundColor: isSuccess
          ? const Color.fromARGB(255, 0, 0, 0)
          : Color.fromARGB(255, 218, 15, 0),
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void showAwesomeSnackbar(BuildContext context, String title, String message,
      {ContentType? contentType}) {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.fixed,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        titleFontSize: 15,
        title: title,
        message: message,
        contentType: contentType ?? ContentType.success,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  Future<void> showLoadingWidget(BuildContext context) async {
    return showDialog(
      barrierColor: Color.fromARGB(223, 0, 8, 21),
      context: context,
      builder: (context) => Dialog(
          // backgroundColor: Colors.amber,
          elevation: 0,
          child: Center(
              child: LoadingAnimationWidget.flickr(
                  leftDotColor: ColorsWidget().blue01(),
                  rightDotColor: ColorsWidget().blue02(),
                  size: 50))),
    );
  }

  void showDelightToastBar(BuildContext context,
      {required String title, required ToastItem toastItem}) async {
    IconData iconData;
    Color color;

    switch (toastItem) {
      case ToastItem.success:
        iconData = EneftyIcons.tick_circle_bold;
        color = Colors.green;
        break;
      case ToastItem.failure:
        iconData = EneftyIcons.danger_outline;
        color = Colors.red;
        break;
      case ToastItem.warning:
        iconData = EneftyIcons.warning_2_outline;
        color = Colors.amber;
        break;
    }

    return DelightToastBar(
      animationDuration: Duration(seconds: 2),
      snackbarDuration: Duration(seconds: 3),
      autoDismiss: true,
      position: DelightSnackbarPosition.bottom,
      builder: (context) => ToastCard(
        leading: Icon(
          iconData,
          size: 28,
          color: Colors.white,
        ),
        color: color,
        title: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.w700, fontSize: 14, color: Colors.white),
        ),
      ),
    ).show(context);
  }

  Future<void> showDelightToastBarNotification(BuildContext context,
      {required String title, required ToastItem toastItem}) async {
    return DelightToastBar(
      // animationDuration: Duration(seconds: 3),
      snackbarDuration: Duration(seconds: 3),
      autoDismiss: true,
      position: DelightSnackbarPosition.top,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Color.fromARGB(255, 231, 241, 255),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: BorderSide(
                color: Color.fromARGB(100, 180, 189, 196), width: 1.0),
          ),
          child: ListTile(
            hoverColor: Colors.transparent,
            // onTap: () {
            //   NavigatorWidget().push(context, NotificationPage());
            // },
            leading: CircleAvatar(
              radius: MediaQueryWidget().width(context, .05),
              backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              child: IconWidget(context, iconData: Icons.notification_add),
            ),
            title: CustomText(
              text: title,
              size: 13,
              textAlign: TextAlign.start,
              overflow: true,
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextsWidget().costumParagraphText(context,
                    text: 'You have received a new message',
                    trimLength: 40,
                    bold: false,
                    textAlign: TextAlign.start),
              ],
            ),
          ),
        ),
      ),
    ).show(context);
  }
}

class LoadingWidgets extends StatelessWidget {
  const LoadingWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: LoadingAnimationWidget.horizontalRotatingDots(
            color: Colors.black, size: 200));
  }
}

class FlickerLoadingWidget extends StatelessWidget {
  const FlickerLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: LoadingAnimationWidget.flickr(
              leftDotColor: ColorsWidget().blue01(),
              rightDotColor: ColorsWidget().blue02(),
              size: 30)),
    );
  }
}