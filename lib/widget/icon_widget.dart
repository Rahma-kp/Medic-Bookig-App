
import 'package:flutter/material.dart';
import 'package:medic/view/userside/home/widget/media_query.dart';

class IconWidget extends StatelessWidget {
  const IconWidget(context,
      {required this.iconData,
      this.color = Colors.black,
      this.size = .061,
      this.padding = 8});

  final IconData iconData;
  final Color color;
  final double size;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Icon(
        iconData,
        color: color,
        size: MediaQueryWidget().width(context, size),
      ),
    );
  }
}

class BadgeIconButtonWidget extends StatelessWidget {
  const BadgeIconButtonWidget(BuildContext context,
      {required this.iconData,
      this.onPressed,
      this.color,
      required this.value});

  final IconData iconData;
  final String value;
  final VoidCallback? onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Badge(
        label: Text(value),
        child: Icon(
          color: color,
          iconData,
          size: MediaQueryWidget().width(context, .061),
        ),
      ),
      onPressed: onPressed,
    );
  }
}

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget(BuildContext context,
      {required this.iconData,
      this.onPressed,
      this.color,
      this.size = .061,
      this.padding = 0});
  final IconData iconData;
  final VoidCallback? onPressed;
  final Color? color;
  final double size;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Icon(
          color: color,
          iconData,
          size: MediaQueryWidget().width(context, size),
        ),
      ),
    );
  }
}