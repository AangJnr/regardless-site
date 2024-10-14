import 'package:flutter/material.dart';
import 'package:regardless_site/extensions/hover_extensions.dart';

import '../../../../app/config/theme_setup.dart';

class PrimaryButtonWidget extends StatelessWidget {
  final String textLabel;
  final Function? onClick;
  final Widget? child;
  final bool isFullWidth;
  final Color color;
  final Color? textColor;
  final OutlinedBorder? shape;
  final bool isLoading;
  final bool isCompact;
  const PrimaryButtonWidget(this.onClick,
      {super.key,
      this.child,
      this.textLabel = "",
      this.color = AppColors.primaryButtonColor,
      this.textColor = AppColors.whiteColor,
      this.shape,
      this.isCompact = false,
      this.isLoading = false,
      this.isFullWidth = false});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          elevation: 1,
          shape: shape ??
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
          minimumSize: Size(isFullWidth ? double.infinity : 130.0, 40.0),
          backgroundColor: color),
      onPressed: isLoading
          ? null
          : (onClick == null)
              ? null
              : () => onClick?.call(),
      child: child ??
          (isLoading
              ? const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: SizedBox(
                    height: 15,
                    width: 15,
                    child: CircularProgressIndicator(
                      backgroundColor: AppColors.blackColor,
                      color: Colors.white,
                    ),
                  ),
                )
              : Padding(
                  padding: isCompact
                      ? const EdgeInsets.symmetric(horizontal: 0, vertical: 8)
                      : const EdgeInsets.all(16),
                  child: Text(
                    textLabel,
                    style:
                        Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(
                              fontSize: isCompact ? 13 : 15.0,
                              color: (onClick == null)
                                  ? AppColors.textColor
                                  : textColor,
                              fontWeight: FontWeight.w600,
                            ),
                  ),
                )),
    ).scaleOnHover();
  }
}
