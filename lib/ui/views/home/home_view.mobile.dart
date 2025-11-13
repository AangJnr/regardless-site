import 'package:regardless_site/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import '../../../app/config/theme_setup.dart';
import '../../widgets/app_logo.dart';
import '../../widgets/footer_bottom.dart';
import '../../widgets/header.dart';
import '../../widgets/regardless_text.dart';
import '../../widgets/social_widget.dart';
import 'home_viewmodel.dart';

class HomeViewMobile extends ViewModelWidget<HomeViewModel> {
  const HomeViewMobile({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  AppLogoWidget(size: Size(25, 25)),
                ],
              ),
            ),
            Center(
              child: RegardlessTextWidget(
                text: 'Make Today Count!',
                words: ['Count!'],
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(color: AppColors.blackColor, fontSize: 25),
                wordsTextStyle: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(color: AppColors.accentColorText, fontSize: 25),
              ),
            ),
            OrientationLayoutBuilder(
              portrait: (_) => Image.asset(
                'assets/header2.png',
                fit: BoxFit.cover,
                width: double.infinity,
                height: screenHeight(context) * 0.7,
              ),
              landscape: (p0) => Image.asset(
                'assets/header2.png',
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: HeaderWidget(
                color: AppColors.whiteColor,
              ),
            ),
            verticalSpaceMedium,
            FooterBottomWidget(),
            verticalSpaceSmall,
            SocialsWidget()
          ],
        ),
      ),
    );
  }
}
