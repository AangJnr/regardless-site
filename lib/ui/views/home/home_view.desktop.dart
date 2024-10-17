import 'package:regardless_site/app/config/theme_setup.dart';
import 'package:regardless_site/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/app_logo.dart';
import '../../widgets/footer_bottom.dart';
import '../../widgets/header.dart';
import '../../widgets/regardless_text.dart';
import 'home_viewmodel.dart';

class HomeViewDesktop extends ViewModelWidget<HomeViewModel> {
  const HomeViewDesktop({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Stack(
        children: [
          Container(
              padding: EdgeInsets.all(largeSize),
              margin: EdgeInsets.only(top: 100, bottom: 50),
              child: Image.asset(
                'assets/header2.png',
                fit: BoxFit.contain,
                height: double.infinity,
                width: double.infinity,
              )),
          Positioned(
            left: 0,
            right: 0,
            top: 30,
            child: RegardlessTextWidget(
              text: 'Make Today Count!',
              words: ['Count!'],
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(color: AppColors.blackColor, fontSize: 45),
              wordsTextStyle: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(color: AppColors.accentColorText, fontSize: 45),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                HeaderWidget(color: AppColors.whiteColor,),
              ],
            ),
          ),
          Positioned(
              top: 40, left: 40, child: AppLogoWidget(size: Size(40, 40))),
          Positioned(bottom: 20, left: 0, right: 0, child: FooterBottomWidget())
        ],
      ),
    );
  }
}
