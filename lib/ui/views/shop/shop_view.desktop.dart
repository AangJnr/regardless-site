import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'shop_viewmodel.dart';

class ShopViewDesktop extends ViewModelWidget<ShopViewModel> {
  const ShopViewDesktop({super.key});

  @override
  Widget build(BuildContext context, ShopViewModel viewModel) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello, DESKTOP UI!',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
