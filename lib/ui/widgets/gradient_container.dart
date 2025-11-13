import 'package:flutter/material.dart';

import '../../../../app/config/theme_setup.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer(
      {this.child,
      this.radius = 20,
      this.margin,
      this.blendColor = Colors.transparent,
      this.size = const Size(double.infinity, double.infinity),
      super.key});
  final Widget? child;
  final Size size;
  final double radius;
  final Color? blendColor;
  final EdgeInsets? margin;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: size.width,
        height: size.height,
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          gradient: LinearGradient(
            colors: [
              AppColors.accentColorAlt,
              AppColors.accentColorAlt.withOpacity(0.5),
              AppColors.canvasColor,
            ],
            stops: const [0, 0.3, 0.8],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: child);
  }
}
