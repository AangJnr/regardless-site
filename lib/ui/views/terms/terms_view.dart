import 'package:flutter/material.dart';
import 'package:regardless_site/ui/views/app_container/app_container_view.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'terms_view.desktop.dart';
import 'terms_view.mobile.dart';
import 'terms_viewmodel.dart';

class TermsView extends StackedView<TermsViewModel> {
  const TermsView({super.key});

  @override
  Widget builder(
    BuildContext context,
    TermsViewModel viewModel,
    Widget? child,
  ) {
    return AppContainerView(
      child: ScreenTypeLayout.builder(
        mobile: (_) => const TermsViewMobile(),
        desktop: (_) => const TermsViewDesktop(),
      ),
    );
  }

  @override
  TermsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TermsViewModel();
}
