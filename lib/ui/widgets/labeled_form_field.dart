import 'package:flutter/material.dart';

import '../../../../app/config/theme_setup.dart';

// ignore: must_be_immutable
class LabeledFormField extends StatelessWidget {
  final String label;
  final bool isRequired;
  final Widget? suffixIcon;
  final bool isDone;
  final TextInputType inputType;
  final String hint;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final Function? onSaved;
  final ValueChanged<String?>? onChanged;
  final bool showKeyboard;
  final Function? onTapped;
  final String? initialValue;
  final TextCapitalization textCapitalization;
  final TextInputAction textInputAction;
  final String? errorMessage;
  final TextEditingController? controller;
  final bool hasError;
  TextEditingController c = TextEditingController();

  LabeledFormField(
      {super.key,
      this.label = '',
      this.hint = "",
      this.isRequired = false,
      this.isDone = false,
      this.inputType = TextInputType.text,
      this.focusNode,
      this.nextFocus,
      this.hasError = false,
      this.suffixIcon,
      this.showKeyboard = true,
      this.errorMessage,
      this.onTapped,
      this.controller,
      this.onChanged,
      this.textInputAction = TextInputAction.next,
      this.initialValue,
      this.textCapitalization = TextCapitalization.none,
      this.onSaved});

  @override
  Widget build(BuildContext context) {
    if (initialValue?.isNotEmpty == true) {
      c.text = initialValue!;
      c.selection = TextSelection(
        baseOffset: initialValue?.length ?? 0,
        extentOffset: initialValue?.length ?? 0,
      );
    }
    final theme =
        Theme.of(context).primaryTextTheme.bodySmall?.copyWith(fontSize: 13);
    return SizedBox(
      width: double.infinity,
      child: TextFormField(
        key: ValueKey(label),
        keyboardType: inputType,
        focusNode: focusNode,
        showCursor: showKeyboard,
        cursorColor: AppColors.blackColor,
        style: theme?.copyWith(color: AppColors.blackColor),
        obscureText: inputType == TextInputType.visiblePassword,
        onTap: () {
          onTapped?.call();
        },
        controller: controller ?? c,
        readOnly: !showKeyboard,
        textCapitalization: textCapitalization,
        textInputAction: isDone ? TextInputAction.done : textInputAction,
        decoration: InputDecoration(
          errorMaxLines: 1,
          hintText: hint,
          hintStyle: theme?.copyWith(color: AppColors.secondartTextColor),
          filled: true,
          fillColor: AppColors.whiteColor,
          errorText: errorMessage,
          label: Container(
            color: Colors.transparent,
            padding: const EdgeInsets.only(right: 8),
            margin: const EdgeInsets.symmetric(horizontal: 0),
            child: Text.rich(
              TextSpan(
                text: label,
                style: theme?.copyWith(color: AppColors.secondartTextColor),
                children: [
                  if (isRequired)
                    TextSpan(
                      text: ' *',
                      style: Theme.of(context)
                          .primaryTextTheme
                          .bodySmall
                          ?.copyWith(
                            color: AppColors.error,
                          ),
                    )
                ],
              ),
            ),
          ),
          errorStyle: const TextStyle(
            color: AppColors.error,
            fontSize: 10,
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 1.5, color: AppColors.error)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 1.5, color: AppColors.error)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 1, color: AppColors.pageBg)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  width: 1.5,
                  color: hasError ? AppColors.error : AppColors.blackColor)),
          suffixIcon:
              Padding(padding: const EdgeInsets.all(12.0), child: suffixIcon),
        ),
        onFieldSubmitted: (_) {
          if (nextFocus != null) {
            FocusScope.of(context).requestFocus(nextFocus);
          }
        },
        onChanged: (value) => onChanged?.call(value),
        onSaved: (newValue) => onChanged?.call(newValue),
      ),
    );
  }
}
