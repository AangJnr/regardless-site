import 'package:flutter/material.dart';
import 'package:regardless_site/ui/views/training_services/section_sessions_info_view.desktop.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import '../../common/ui_helpers.dart';
 import 'section_sessions_info_viewmodel.dart';
import 'package:regardless_site/ui/widgets/primary_button_outline_widget.dart';
import 'package:regardless_site/ui/widgets/regardless_text.dart';

import '../../../app/config/theme_setup.dart';
import '../../common/app_strings.dart';
import '../section_download_app/section_download_app_view.dart';

class SectionSessionsInfoViewMobile
    extends ViewModelWidget<SectionSessionsInfoViewModel> {
  const SectionSessionsInfoViewMobile({super.key});

  @override
  Widget build(BuildContext context, SectionSessionsInfoViewModel viewModel) {
    return OrientationLayoutBuilder(portrait: (_)=> Column(children: [
      Container(
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          child: Stack(children: [
            Image.asset(
              'assets/header1.png',
              fit: BoxFit.contain,
              width: double.infinity,
            ),
            Positioned(
                bottom: 150,
                left: 20, top:20,
                child: Container(
                  width:200,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black.withOpacity(0.3),
                  ),
                  child: RegardlessTextWidget(
                    text: kSessionsInfoText,
                    textAlign: TextAlign.start,
                    words: [
                      'Fitness',
                      'Journey',
                      'Customised',
                      'Training',
                      'Programs',
                      'Goals',
                      'Individual',
                      'Group',
                      'Corporate',
                      'Organization'
                    ],
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontSize: 13, color: AppColors.whiteColor),
                    wordsTextStyle: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: AppColors.accentColorText),
                  ),
                )),
            Positioned(
                bottom: 40,
                right: 20,
                child: SizedBox(
                  width: 200,
                  child: RegardlessTextWidget(
                    text: kSessionsInfoText2,
                    textAlign: TextAlign.start,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontSize: 13, color: AppColors.whiteColor),
                  ),
                ))
          ])),
      Container(
          padding: EdgeInsets.all(16),
          color: Colors.black87,
          child: Column(
            children: viewModel.texts
                .map(
                  (e) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: _buildChildWidgets(context, viewModel, e)),
                )
                .toList(),
          )),
    ]), landscape: (_)=> SectionSessionsInfoViewDesktop(),);
  }

  List<Widget> _buildChildWidgets(BuildContext context,
      SectionSessionsInfoViewModel viewModel, RegardlessText e) {
    return [
      Column(
        children: [
          RegardlessTextWidget(
            text: e.text,
            textAlign: TextAlign.start,
            words: e.words,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontSize: 13, color: AppColors.whiteColor, height: 1.6),
            wordsTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 15,height: 2,
                fontWeight: FontWeight.bold,
                color: AppColors.accentColorText),
          ),
          verticalSpaceSmall,
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              e.imageAsset ?? '',
              fit: BoxFit.cover,
            ),
          ),
          verticalSpaceMedium,
          PrimaryButtonOutlineWidget(
            () => viewModel.showBookNowDialog(e),
            textLabel: 'Book Now',
            color: AppColors.whiteColor,
          )
        ],
      ),
      verticalSpaceLarge,
    ];
  }
}
