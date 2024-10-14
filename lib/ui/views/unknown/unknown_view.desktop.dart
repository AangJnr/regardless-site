import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../app/config/theme_setup.dart';
import '../../common/app_colors.dart';
import '../../common/ui_helpers.dart';
import 'unknown_viewmodel.dart';

class UnknownViewDesktop extends ViewModelWidget<UnknownViewModel> {
  const UnknownViewDesktop({super.key});

  @override
  Widget build(BuildContext context, UnknownViewModel viewModel) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/main_logo.png',
                height: 90, width: 90, color: AppColors.greyToneColor600),
            verticalSpaceLarge,
            const Text(
              '404',
              style: TextStyle(
                color: Colors.white,
                fontSize: 80,
                fontWeight: FontWeight.w800,
                height: 0.95,
                letterSpacing: 20.0,
              ),
            ),
            verticalSpaceSmall,
            const Text(
              'PAGE NOT FOUND',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                letterSpacing: 20.0,
                wordSpacing: 10.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
