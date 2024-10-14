import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../app/config/theme_setup.dart';

class RegardlessTextWidget extends StatelessWidget {
  final String text;
  final List<String> words;
  final TextStyle? style;
  final TextStyle? wordsTextStyle;
  final TextAlign textAlign;
  final ValueChanged<String>? onWordTap;
  final bool hasLinks;
  const RegardlessTextWidget(
      {required this.text,
      this.style,
      this.wordsTextStyle,
      this.words = const [],
      this.textAlign = TextAlign.center,
      this.onWordTap,
      this.hasLinks = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SelectableText.rich(
      TextSpan(
          children:
              _highlightWords(text, words, style, onWordTap, wordsTextStyle),
          style: style
          // Default style
          ),
      textAlign: textAlign,
    );
  }
}

List<TextSpan> _highlightWords(String text, List<String> wordsToHighlight,
    TextStyle? textStyle, ValueChanged<String>? onWordTap,
    [TextStyle? wordsToHighlightStyle]) {
  List<TextSpan> spans = [];
  text.splitMapJoin(
    RegExp(wordsToHighlight.join('|')), // Match any of the highlight words
    onMatch: (Match match) {
      String matchText = match[0]!;
      spans.add(
        TextSpan(
            text: matchText,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                onWordTap?.call(matchText);
              },
            style: wordsToHighlightStyle ??
                textStyle?.copyWith(
                  color: AppColors.accentColorText,
                  fontWeight: FontWeight.bold,
                )),
      );
      return matchText;
    },
    onNonMatch: (String nonMatch) {
      spans.add(TextSpan(
          text: nonMatch,
          style: textStyle?.copyWith())); // Add the regular text
      return nonMatch;
    },
  );
  return spans;
}
