import 'package:flutter/material.dart';
import 'package:flutter_faq/flutter_faq.dart';
import 'package:stacked/stacked.dart';

import '../../../app/config/theme_setup.dart';
import '../../common/app_constants.dart';
import '../../common/ui_helpers.dart';
import '../../widgets/footer.dart';
import '../../widgets/header.dart';
import 'faq_viewmodel.dart';

class FaqViewDesktop extends ViewModelWidget<FaqViewModel> {
  const FaqViewDesktop({super.key});

  @override
  Widget build(BuildContext context, FaqViewModel viewModel) {
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
                BreadcrumbsWidget(
                  useCase: viewModel.linkUseCase,
                ),
                verticalSpaceMedium,
                Text(
                  'Frequently Asked Questions',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: AppColors.accentColorText),
                ),
                verticalSpaceLarge,
                Expanded(
                    child: SingleChildScrollView(
                        child: Column(children: [
                  ...viewModel.faqTopics
                      .map((e) => _buildFaqTopicWidget(context, e))
                      .toList(),
                  verticalSpaceLarge,
                  FooterWidget(),
                  verticalSpaceMassive
                ]))),
              ],
            )),
      ),
    );
  }

  Widget _buildFaqTopicWidget(BuildContext context, FaqTopic topic) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          topic.title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.blackColor),
        ),
        verticalSpaceSmall,
        ...topic.faqs
            .map((e) => FAQ(
                  question: e.question,
                  answer: e.answer,
                  showDivider: false,
                  ansPadding: const EdgeInsets.all(30),
                  queStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 16,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.bold),
                  ansStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontSize: 13,
                      color: AppColors.blackColor600,
                      fontWeight: FontWeight.w700),
                  separator: Container(
                    height: 2,
                    width: double.infinity,
                    color: AppColors.divider,
                  ),
                  queDecoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: const BorderRadius.all(Radius.circular(0))),
                  ansDecoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(0)),
                ))
            .toList(),
        verticalSpaceMedium,
        Divider(height: 2, color: AppColors.divider),
        verticalSpaceMedium,
      ],
    );
  }
}
