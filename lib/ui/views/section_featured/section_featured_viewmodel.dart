import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';

class SectionFeaturedViewModel extends BaseViewModel {
  SectionFeaturedViewModel() {
    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      animateToPage((_currentPage + 1) % images.length);
    });
  }
  List<ImageWithColor> images = [
    ImageWithColor("assets/mockup1.png", Color.fromARGB(255, 254, 172, 247)),
    ImageWithColor("assets/mockup2.png", Color.fromARGB(255, 237, 120, 24)),
    ImageWithColor("assets/mockup3.png", Color.fromARGB(255, 35, 217, 253)),
    ImageWithColor("assets/mockup4.png", Color.fromARGB(255, 236, 236, 236)),
  ];

  List<String> shirtMockups = [
    "assets/mockup4.png",
    "assets/mockup5.png",
    "assets/mockup6.png",
    "assets/mockup7.png"
  ];
  PageController pageViewController = PageController();
  int _currentPage = 0;
  Timer? timer;

  void animateToPage(int i) async {
    pageViewController.animateToPage(
      i,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  void setCurrentPage(int value) {
    _currentPage = value;
  }
}

class ImageWithColor {
  final String image;
  final Color color;
  ImageWithColor(this.image, this.color);
}
