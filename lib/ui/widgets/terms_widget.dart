import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:regardless_site/ui/widgets/regardless_text.dart';
import 'package:stacked/stacked.dart';

import '../views/terms/terms_viewmodel.dart';

class TermsAndPrivacyPolicyWidget extends StackedView<TermsViewModel> {
  const TermsAndPrivacyPolicyWidget({
    this.text =
        'By continuing to use Regardless you agree to our Terms of Service and Privacy Policy',
    this.words = const ['Terms of Service', 'Privacy Policy'],
    this.textAlign = TextAlign.center,
    super.key,
  });

  final String text;
  final List<String> words;
  final TextAlign textAlign;

  @override
  Widget builder(
      BuildContext context, TermsViewModel viewModel, Widget? child) {
    return RegardlessTextWidget(
      onWordTap: (word) {
        if (word == 'Terms of Service') {
          viewModel.goToTermsView();
        } else if (word == 'Privacy Policy') {
          viewModel.goToPolicyView();
        }
      },
      text: text,
      words: words,
      textAlign: textAlign,
      wordsTextStyle: Theme.of(context).primaryTextTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w700,
            height: 2,
            fontSize: 11,
            decoration: TextDecoration.underline,
          ),
      style: Theme.of(context).primaryTextTheme.bodySmall?.copyWith(
            height: 2,
            fontSize: 11,
          ),
    );
  }

  @override
  TermsViewModel viewModelBuilder(BuildContext context) {
    return TermsViewModel();
  }
}
