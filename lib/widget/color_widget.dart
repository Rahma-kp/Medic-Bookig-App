import 'package:flutter/material.dart';

class ColorsWidget {
  linergradientColor() {
    return const LinearGradient(
      colors: [
        Color.fromARGB(255, 0, 195, 255),
        Color.fromARGB(255, 9, 97, 245),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }

  blue01() {
    return const Color.fromARGB(255, 32, 146, 208);
  }

  blue02() {
    return const Color.fromARGB(255, 17, 126, 194);
  }
}