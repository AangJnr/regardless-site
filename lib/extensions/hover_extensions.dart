import 'package:regardless_site/ui/widgets/mouse_transforms/scale_on_hover.dart';
import 'package:regardless_site/ui/widgets/mouse_transforms/translate_on_hover.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

extension HoverExtensions on Widget {
  Widget get showCursorOnHover {
    return _returnUnalteredOnMobile(MouseRegion(
      cursor: SystemMouseCursors.click,
      child: this,
    ));
  }

  /// Moves the widget by x,y pixels on hover
  ///
  /// to move up use -y values, to move left use -x values
  Widget moveOnHover({double? x, double? y}) {
    return _returnUnalteredOnMobile(TranslateOnHover(
      x: x,
      y: y,
      child: this,
    ));
  }

  /// Scales the widget by [scale] on hover
  Widget scaleOnHover({double scale = 1.1}) {
    return _returnUnalteredOnMobile(ScaleOnHover(
      scale: scale,
      child: this,
    ));
  }

  /// Adds an underline to the widget on hover
  Widget underlineOnHover(
      {Color underlineColor = Colors.black, double underlineThickness = 2.0}) {
    return _returnUnalteredOnMobile(UnderlineOnHover(
      underlineColor: underlineColor,
      underlineThickness: underlineThickness,
      child: this,
    ));
  }

  /// Takes in the alteredWidget and if we detect we're on Android or iOS
  /// we return the unaltered widget.
  ///
  /// The reason we can do this is because all altered widgets require mouse
  /// functionality to work.
  Widget _returnUnalteredOnMobile(Widget alteredWidget) {
    if (kIsWeb) {
      return alteredWidget;
    }
    return this;
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  String stripExtra() =>
       trim().replaceAll(RegExp(r'[\/\s\-]'), '').toLowerCase();
}
