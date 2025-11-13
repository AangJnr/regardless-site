import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../app/config/theme_setup.dart';
import 'material_inkwell.dart';

class LabeledTextField extends StatelessWidget {
  final String label;
  final bool isRequired;
  final String hint;
  final VoidCallback? onTap;
  final String value;
  final IconData? iconData;
  final String? errorMessage;
  final Color? textColor;
  final Color enabledColor;
  final bool hasError;
  const LabeledTextField({
    super.key,
    this.label = '',
    this.hint = "",
    this.isRequired = false,
    this.errorMessage,
    this.onTap,
    this.iconData,
    this.enabledColor = AppColors.whiteColor75,
    this.textColor = AppColors.blackColor,
    this.value = '',
    this.hasError = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme =
        Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(fontSize: 14);
    return MaterialInkWell(
      radiusValue: 12,
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.whiteColor,
              border: hasError
                  ? Border.all(width: 1.5, color: AppColors.error)
                  : Border.all(width: 1, color: AppColors.whiteColor),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    value.isEmpty ? label : value,
                    style: theme?.copyWith(
                      color: value.isEmpty
                          ? AppColors.secondartTextColor
                          : textColor,
                    ),
                  ),
                ),
                if (iconData != null) ...[
                  const SizedBox(width: 16),
                  FaIcon(iconData, size: 16),
                  const SizedBox(width: 8),
                ],
              ],
            ),
          ),
          if (hasError) ...[
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Text(
                errorMessage ?? '',
                style: const TextStyle(
                  color: AppColors.error,
                  fontSize: 10,
                ),
              ),
            )
          ]
        ],
      ),
    );
  }
}
