import 'package:regardless_site/ui/common/app_colors.dart';
import 'package:regardless_site/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../app/config/theme_setup.dart';
import '../../widgets/app_logo.dart';
import '../../widgets/footer_bottom.dart';
import '../../widgets/header.dart';
import '../../widgets/regardless_text.dart';
import 'home_viewmodel.dart';

class HomeViewMobile extends ViewModelWidget<HomeViewModel> {
  const HomeViewMobile({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: AppLogoWidget(size: Size(40, 40)),
          ),
          Center(
            child: RegardlessTextWidget(
              text: 'Make Today Count!',
              words: ['Count!'],
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(color: AppColors.blackColor, fontSize: 35),
              wordsTextStyle: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(color: AppColors.accentColorText, fontSize: 35),
            ),
          ),
          Image.asset(
            'assets/header2.png',
            fit: BoxFit.fitWidth,
            width: double.infinity,
          ),
          Center(
            child: HeaderWidget(
              color: AppColors.whiteColor,
            ),
          ),
          Spacer(),
          FooterBottomWidget()
        ],
      ),
    );
  }
}
