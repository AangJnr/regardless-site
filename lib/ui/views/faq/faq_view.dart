import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'faq_view.desktop.dart';
import 'faq_view.mobile.dart';
import 'faq_viewmodel.dart';

class FaqView extends StackedView<FaqViewModel> {
  const FaqView({super.key});

  @override
  Widget builder(
    BuildContext context,
    FaqViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const FaqViewMobile(),
      desktop: (_) => const FaqViewDesktop(),
    );
  }

  @override
  FaqViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      FaqViewModel();
}
