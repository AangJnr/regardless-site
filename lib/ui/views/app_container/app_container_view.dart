import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'app_container_view.desktop.dart';
import 'app_container_view.mobile.dart';
import 'app_container_viewmodel.dart';

class AppContainerView extends StackedView<AppContainerViewModel> {
  const AppContainerView({required this.child, super.key});
  final Widget child;
  @override
  Widget builder(
    BuildContext context,
    AppContainerViewModel viewModel,
    Widget? c,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => AppContainerViewMobile(child: child),
      desktop: (_) => AppContainerViewDesktop(child: child),
    );
  }

  @override
  AppContainerViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AppContainerViewModel();
}
