import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'section_success_stories_viewmodel.dart';

class SectionSuccessStoriesViewMobile
    extends ViewModelWidget<SectionSuccessStoriesViewModel> {
  const SectionSuccessStoriesViewMobile({super.key});

  @override
  Widget build(BuildContext context, SectionSuccessStoriesViewModel viewModel) {
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
