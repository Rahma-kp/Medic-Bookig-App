
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:medic/controller/carousel_controller.dart';
import 'package:medic/widget/imgae.dart';
import 'package:provider/provider.dart';

class homeCarouselSlider extends StatelessWidget {
  const homeCarouselSlider({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeCaroselController>(builder: (context, value, child) => 
      CarouselSlider(
        items: imagesList.map((item) {
          return Container(
            margin: EdgeInsets.all(size.width * 0.00),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              child: Image.asset(
                item,
                fit: BoxFit.cover,
                width: size.width * 0.9,
                height: size.height * 0.3,
              ),
            ),
          );
        }).toList(),
        options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: true,
          aspectRatio: 2.0,
          onPageChanged: (index, reason) {
            value.carouselChange(index);
          },
        ),
      ),
    );
  }
}
