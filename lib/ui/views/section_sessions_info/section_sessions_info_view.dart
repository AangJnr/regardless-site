import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'section_sessions_info_view.desktop.dart';
import 'section_sessions_info_view.mobile.dart';
import 'section_sessions_info_viewmodel.dart';

class SectionSessionsInfoView
    extends StackedView<SectionSessionsInfoViewModel> {
  const SectionSessionsInfoView({super.key});

  @override
  Widget builder(
    BuildContext context,
    SectionSessionsInfoViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const SectionSessionsInfoViewMobile(),
      desktop: (_) => const SectionSessionsInfoViewDesktop(),
    );
  }

  @override
  SectionSessionsInfoViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SectionSessionsInfoViewModel();
}
