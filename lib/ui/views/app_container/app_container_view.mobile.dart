import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

 import '../../common/ui_helpers.dart';
import '../../widgets/footer.dart';
import '../../widgets/header.dart';
import 'app_container_viewmodel.dart';

class AppContainerViewMobile extends ViewModelWidget<AppContainerViewModel> {
  const AppContainerViewMobile({required this.child, required this.canvasColor, super.key});
  final Color canvasColor;

  final Widget child;
  @override
  Widget build(BuildContext context, AppContainerViewModel viewModel) {
    return Scaffold(
      backgroundColor:  canvasColor,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [verticalSpaceMedium,
            const HeaderWidget(showLogo: true,),verticalSpaceMedium,
            Expanded(
              child: SingleChildScrollView(
                controller: viewModel.scrollController,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    child,
                    FooterWidget(
                      scrollController: viewModel.scrollController,
                    ),
                    verticalSpaceMedium
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
