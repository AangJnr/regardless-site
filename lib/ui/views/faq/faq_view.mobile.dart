import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'faq_viewmodel.dart';

class FaqViewMobile extends ViewModelWidget<FaqViewModel> {
  const FaqViewMobile({super.key});

  @override
  Widget build(BuildContext context, FaqViewModel viewModel) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello, MOBILE UI!',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
