import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'shop_viewmodel.dart';

class ShopViewMobile extends ViewModelWidget<ShopViewModel> {
  const ShopViewMobile({super.key});

  @override
  Widget build(BuildContext context, ShopViewModel viewModel) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Regardless Shop Coming Soon!',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
