import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../app/config/theme_setup.dart';
import 'shop_viewmodel.dart';

class ShopViewDesktop extends ViewModelWidget<ShopViewModel> {
  const ShopViewDesktop({super.key});

  @override
  Widget build(BuildContext context, ShopViewModel viewModel) {
    return Container(
        decoration: BoxDecoration(color: AppColors.canvasColor),
        height: 700,
        child: SizedBox());
  }
}
