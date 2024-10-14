import 'package:flutter/material.dart';

import '../../../../app/config/theme_setup.dart';

class PrimaryButtonOutlineWidget extends StatelessWidget {
  final String textLabel;
  final Function? onClick;
  final Size? size;
  final double radius;
  final Color? textColor;
  final Widget? child;
  final bool isFullWidth;
  final bool isCompact;

  const PrimaryButtonOutlineWidget(this.onClick,
      {Key? key,
      this.child,
      this.radius = 30.0,
      this.size = const Size(130.0, 40.0),
      this.textLabel = "",
      this.isCompact = false,
      this.isFullWidth = false,
      this.textColor = AppColors.blackColor})
      : super(key: key);
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
        side: const BorderSide(color: AppColors.primaryColor, width: 1),
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
                    color: textColor,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
    );
  }
}
