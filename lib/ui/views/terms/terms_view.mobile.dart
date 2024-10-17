import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../app/config/theme_setup.dart';
import '../../common/ui_helpers.dart';
import '../../widgets/regardless_text.dart';
import 'terms_viewmodel.dart';

class TermsViewMobile extends ViewModelWidget<TermsViewModel> {
  const TermsViewMobile({super.key});

  @override
  Widget build(BuildContext context, TermsViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            viewModel.title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: AppColors.accentColorText),
          ),
          verticalSpaceLarge,
          RegardlessTextWidget(
            text: viewModel.data,
            textAlign: TextAlign.start,
            words: viewModel.words,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 14,
                  color: AppColors.blackColor,
                  height: 1.6,
                  letterSpacing: 0),
            wordsTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
