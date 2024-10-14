import 'package:flutter/material.dart';
import 'package:regardless_site/ui/common/ui_helpers.dart';
import 'package:regardless_site/ui/widgets/footer.dart';
import 'package:stacked/stacked.dart';

import '../../../app/config/theme_setup.dart';
import '../../common/app_constants.dart';
import '../../widgets/header.dart';
import '../../widgets/regardless_text.dart';
import 'terms_viewmodel.dart';

class TermsViewDesktop extends ViewModelWidget<TermsViewModel> {
  const TermsViewDesktop({super.key});

  @override
  Widget build(BuildContext context, TermsViewModel viewModel) {
    return Scaffold(
      backgroundColor: AppColors.canvasColor,
      body: Center(
        child: Container(
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(10)),
            width: kdDesktopMaxContentWidth,
            height: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: largeSize),
            margin: const EdgeInsets.only(
                left: largeSize, top: largeSize, right: largeSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeaderWidget(
                  margin: EdgeInsets.only(top: 30, bottom: 50),
                ),
                BreadcrumbsWidget(useCase: viewModel.linkUseCase),
                verticalSpaceMedium,
                Text(
                  viewModel.title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: AppColors.accentColorText),
                ),
                verticalSpaceLarge,
                Expanded(
                    child: SingleChildScrollView(
                        child: Column(children: [
                  RegardlessTextWidget(
                    text: viewModel.data,
                    textAlign: TextAlign.start,
                    words: viewModel.words,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 14,
                        color: AppColors.blackColor,
                        height: 1.6,
                        letterSpacing: 0),
                    wordsTextStyle: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                  ),
                  verticalSpaceLarge,
                  FooterWidget(),
                  verticalSpaceMassive
                ]))),
              ],
            )),
      ),
    );
  }
}
