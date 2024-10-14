import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'section_featured_view.desktop.dart';
import 'section_featured_view.mobile.dart';
import 'section_featured_viewmodel.dart';

class SectionFeaturedView extends StackedView<SectionFeaturedViewModel> {
  const SectionFeaturedView({super.key});

  @override
  Widget builder(
    BuildContext context,
    SectionFeaturedViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const SectionFeaturedViewMobile(),
      desktop: (_) => const SectionFeaturedViewDesktop(),
    );
  }

  @override
  SectionFeaturedViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SectionFeaturedViewModel();
}
