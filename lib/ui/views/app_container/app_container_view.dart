import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import '../../../app/config/theme_setup.dart';
import 'app_container_view.desktop.dart';
import 'app_container_view.mobile.dart';
import 'app_container_viewmodel.dart';

class AppContainerView extends StackedView<AppContainerViewModel> {
  const AppContainerView({required this.child, this.canvasColor = AppColors.canvasColor, super.key});
  final Widget child;
  final Color canvasColor;
  @override
  Widget builder(
    BuildContext context,
    AppContainerViewModel viewModel,
    Widget? c,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => AppContainerViewMobile(canvasColor: canvasColor, child: child),
      desktop: (_) => AppContainerViewDesktop(canvasColor: canvasColor, child: child),
    );
  }

  @override
  AppContainerViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AppContainerViewModel();
}
