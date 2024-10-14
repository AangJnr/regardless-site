import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'shop_view.desktop.dart';
import 'shop_view.mobile.dart';
import 'shop_viewmodel.dart';

class ShopView extends StackedView<ShopViewModel> {
  const ShopView({super.key});

  @override
  Widget builder(
    BuildContext context,
    ShopViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const ShopViewMobile(),
      desktop: (_) => const ShopViewDesktop(),
    );
  }

  @override
  ShopViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ShopViewModel();
}
