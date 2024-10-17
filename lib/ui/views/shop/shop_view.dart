import 'package:flutter/material.dart';
import 'package:regardless_site/ui/views/section_featured/section_featured_view.dart';
 import 'package:stacked/stacked.dart';

import '../app_container/app_container_view.dart';
import 'shop_viewmodel.dart';

class ShopView extends StackedView<ShopViewModel> {
  const ShopView({super.key});

  @override
  Widget builder(
    BuildContext context,
    ShopViewModel viewModel,
    Widget? child,
  ) {
    return AppContainerView(
      child: SectionFeaturedView(),
      //  ScreenTypeLayout.builder(
      //   mobile: (_) => const ShopViewMobile(),
      //   desktop: (_) => const ShopViewDesktop(),
      // ),
    );
  }

  @override
  ShopViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ShopViewModel();
}
