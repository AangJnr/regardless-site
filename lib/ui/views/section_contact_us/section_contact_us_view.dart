import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'section_contact_us_view.desktop.dart';
import 'section_contact_us_view.mobile.dart';
import 'section_contact_us_viewmodel.dart';

class SectionContactUsView extends StackedView<SectionContactUsViewModel> {
  const SectionContactUsView({super.key});

  @override
  Widget builder(
    BuildContext context,
    SectionContactUsViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const SectionContactUsViewMobile(),
      desktop: (_) => const SectionContactUsViewDesktop(),
    );
  }

  @override
  SectionContactUsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SectionContactUsViewModel();
}
