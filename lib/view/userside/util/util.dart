import 'dart:io';
import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

String generateChatRoomId({
  required String uId1,
  required String uId2,
}) {
  List<String> uIds = [uId1, uId2];
  uIds.sort();
  String chatId = uIds.join();
  return chatId;
}

String textToCamelCase({required String text}) {
  List splited = text.split(' ');
  List<String> capitalLetter = [];
  for (var x in splited) {
    capitalLetter.add(x[0].toUpperCase() + x.substring(1));
  }
  String join = capitalLetter.join(' ');
  return join;
}

Future<File?> generateIconImage(String name) async {
  File? imageFile;

  String firstLetter = name.isNotEmpty ? name.substring(0, 1) : '';
  final Random random = Random();
  final Color bgColor = Color.fromARGB(
    255,
    random.nextInt(256),
    random.nextInt(256),
    random.nextInt(256),
  );

  final pictureRecorder = ui.PictureRecorder();
  final canvas = Canvas(pictureRecorder);

  final iconSize = 200.0;
  final textPainter = TextPainter(
    text: TextSpan(
      text: firstLetter,
      style: TextStyle(
        color: Colors.white,
        fontSize: 50.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    textDirection: TextDirection.ltr,
  )..layout();

  final textWidth = textPainter.width;
  final textHeight = textPainter.height;

  canvas.drawRect(
    Rect.fromLTWH(0, 0, iconSize, iconSize),
    Paint()..color = bgColor,
  );

  textPainter.paint(
    canvas,
    Offset(
      (iconSize - textWidth) / 2,
      (iconSize - textHeight) / 2,
    ),
  );

  final picture = pictureRecorder.endRecording();
  final img = await picture.toImage(
    iconSize.toInt(),
    iconSize.toInt(),
  );
  final byteData = await img.toByteData(format: ui.ImageByteFormat.png);

  if (byteData != null) {
    final directory = await getApplicationDocumentsDirectory();
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final fileName = 'generated_image_$timestamp.png';
    final imageFilePath = '${directory.path}/$fileName';
    imageFile = File(imageFilePath);
    await imageFile.writeAsBytes(byteData.buffer.asUint8List());
  }

  return imageFile;
}