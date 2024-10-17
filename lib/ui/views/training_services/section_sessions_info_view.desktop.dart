import 'package:flutter/material.dart';
import 'package:regardless_site/ui/common/ui_helpers.dart';
  import 'package:regardless_site/ui/widgets/primary_button_outline_widget.dart';
import 'package:regardless_site/ui/widgets/regardless_text.dart';
import 'package:stacked/stacked.dart';

import '../../../app/config/theme_setup.dart';
import '../../common/app_strings.dart';
import '../section_download_app/section_download_app_view.dart';
import 'section_sessions_info_viewmodel.dart';

class SectionSessionsInfoViewDesktop
    extends ViewModelWidget<SectionSessionsInfoViewModel> {
  const SectionSessionsInfoViewDesktop({super.key});

  @override
  Widget build(BuildContext context, SectionSessionsInfoViewModel viewModel) {
    return Column(children: [
      Container(
          decoration: BoxDecoration(
              color: Colors.black,
              ),
          height: 700,
          child: Stack(children: [
            Image.asset(
              'assets/header1.png',
              fit: BoxFit.contain,
              height: 700,
              width: double.infinity,
            ),
            Positioned(
                bottom: 150,
                left: 80,
                child: Container(
                  width: 400,
                  padding: EdgeInsets.all(20),
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
                        ?.copyWith(fontSize: 20, color: AppColors.whiteColor),
                    wordsTextStyle: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.accentColorText),
                  ),
                )),
            Positioned(
                bottom: 40,
                right: 80,
                child: SizedBox(
                  width: 400,
                  child: RegardlessTextWidget(
                    text: kSessionsInfoText2,
                    textAlign: TextAlign.start,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontSize: 20, color: AppColors.whiteColor),
                  ),
                ))
          ])),
      Container(
          padding: EdgeInsets.all(massiveSize),
          color: Colors.black87,
          child: Column(
            children: viewModel.texts
                .map(
                  (e) => Column(children: [
                    Row(
                        children: e.imageAsset?.contains('group') == true
                            ? _buildChildWidgets(
                                    context, viewModel, e)
                                .reversed
                                .toList()
                            : _buildChildWidgets(
                                context, viewModel, e)),
                    verticalSpaceLarge
                  ]),
                )
                .toList(),
          )),
    ]);
  }

  List<Widget> _buildChildWidgets(
      BuildContext context, SectionSessionsInfoViewModel viewModel, RegardlessText e) {
    return [
      Expanded(
          flex: 2,
          child: Center(
              child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RegardlessTextWidget(
                  text: e.text,
                  textAlign: TextAlign.start,
                  words: e.words,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 14, color: AppColors.whiteColor),
                  wordsTextStyle: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: AppColors.accentColorText),
                ),
                verticalSpaceMedium,
                PrimaryButtonOutlineWidget(
                  ()=>viewModel.showBookNowDialog(e),
                  textLabel: 'Book Now',
                 color: AppColors.whiteColor,
                )
              ],
            ),
          ))),
      horizontalSpaceMassive,
      Expanded(
          flex: 3,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              e.imageAsset ?? '',
              fit: BoxFit.cover,
              height: 300,
            ),
          ))
    ];
  }
}
