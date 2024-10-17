import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../app/config/theme_setup.dart';
import '../../common/ui_helpers.dart';
import '../../widgets/footer.dart';
import '../../widgets/header.dart';
import 'app_container_viewmodel.dart';

class AppContainerViewMobile extends ViewModelWidget<AppContainerViewModel> {
  const AppContainerViewMobile({required this.child, super.key});

  final Widget child;
  @override
  Widget build(BuildContext context, AppContainerViewModel viewModel) {
    return Scaffold(
      backgroundColor: AppColors.canvasColor,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [verticalSpaceMedium,
            const HeaderWidget(),verticalSpaceMedium,
            Expanded(
              child: SingleChildScrollView(
                controller: viewModel.scrollController,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    child,
                    FooterWidget(
                      scrollController: viewModel.scrollController,
                    ),
                    verticalSpaceMedium
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
