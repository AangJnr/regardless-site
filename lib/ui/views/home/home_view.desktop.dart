import 'package:regardless_site/app/config/theme_setup.dart';
import 'package:regardless_site/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:regardless_site/ui/usecase/links_usecase.dart';
import 'package:regardless_site/ui/widgets/social_widget.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/app_logo.dart';
import '../../widgets/footer_bottom.dart';
import '../../widgets/regardless_text.dart';
import 'home_viewmodel.dart';

class HomeViewDesktop extends ViewModelWidget<HomeViewModel> {
  const HomeViewDesktop({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Column(
          children: [
            // top row with logo
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Row(
                children: [
                  AppLogoWidget(size: Size(40, 40)),
                  const Spacer(),
                ],
              ),
            ),

            // title
            RegardlessTextWidget(
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

            Expanded(
              flex: 6,
              child: Padding(
                padding: EdgeInsets.all(largeSize),
                child: Column(
                  children: [
                    Expanded(
                      child: Image.asset(
                        'assets/header2.png',
                        fit: BoxFit.contain,
                        width: double.infinity,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Center(
                      child: Wrap(
                        spacing: 40,
                        runSpacing: 12,
                        alignment: WrapAlignment.center,
                        children: [
                          _buildActionLink(context, "TRAINING SERVICES",
                              viewModel.linkUseCase),
                          _buildActionLink(
                              context, "MOBILE APP", viewModel.linkUseCase),
                          _buildActionLink(
                              context, "SHOP", viewModel.linkUseCase),
                          _buildActionLink(
                              context, "CONTACT", viewModel.linkUseCase),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // footer + socials
            Padding(
              padding: const EdgeInsets.only(bottom: 12, left: 12, right: 12),
              child: Row(
                children: [
                  Expanded(child: FooterBottomWidget()),
                  SocialsWidget(),
                  horizontalSpaceMedium
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionLink(
          BuildContext context, String title, LinksUseCase linkUseCase) =>
      MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => linkUseCase.goToPage(title),
          child: Text(
            title,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                fontSize: 18,
                color: AppColors.blackColor600, // black color
                decoration: TextDecoration.underline),
          ),
        ),
      );
}
