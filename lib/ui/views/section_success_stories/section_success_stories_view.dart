import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'section_success_stories_view.desktop.dart';
import 'section_success_stories_view.mobile.dart';
import 'section_success_stories_viewmodel.dart';

class SectionSuccessStoriesView
    extends StackedView<SectionSuccessStoriesViewModel> {
  const SectionSuccessStoriesView({super.key});

  @override
  Widget builder(
    BuildContext context,
    SectionSuccessStoriesViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const SectionSuccessStoriesViewMobile(),
      desktop: (_) => const SectionSuccessStoriesViewDesktop(),
    );
  }

  @override
  SectionSuccessStoriesViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SectionSuccessStoriesViewModel();
}
