import 'package:flutter/material.dart';

import '../../app/config/theme_setup.dart';

class AppLogoWidget extends StatelessWidget {
  final Color color;
  final Size size;
  const AppLogoWidget(
      {this.color = AppColors.blackColor600,
      this.size = const Size(50, 50),
      super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/main_logo.png',
        height: size.height, width: size.width, color: color);
  }
}
