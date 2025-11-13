import 'package:flutter/material.dart';

import '../../../../app/config/theme_setup.dart';

class PrimaryButtonOutlineWidget extends StatelessWidget {
  final String textLabel;
  final Function? onClick;
  final Size? size;
  final double radius;
  final Color color;
  final Widget? child;
  final bool isFullWidth;
  final bool isCompact;

  const PrimaryButtonOutlineWidget(this.onClick,
      {super.key,
      this.child,
      this.radius = 10.0,
      this.size = const Size(130.0, 40.0),
      this.textLabel = "",
      this.isCompact = false,
      this.isFullWidth = false,
      this.color = AppColors.blackColor});
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        minimumSize: isFullWidth
            ? Size(isFullWidth ? double.infinity : 130.0, 40.0)
            : size,
        side: BorderSide(color: color, width: 1),
      ),
      onPressed: () => onClick?.call(),
      child: child ??
          Padding(
            padding: isCompact
                ? const EdgeInsets.symmetric(horizontal: 0, vertical: 8)
                : const EdgeInsets.all(16),
            child: Text(
              textLabel,
              style: Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(
                    fontSize: isCompact ? 13 : 15.0,
                    letterSpacing: -0.5,
                    color: color,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
    );
  }
}
