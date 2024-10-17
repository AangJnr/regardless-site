import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

 import '../../common/app_constants.dart';
import '../../common/ui_helpers.dart';
import '../../widgets/footer.dart';
import '../../widgets/header.dart';
import 'app_container_viewmodel.dart';

class AppContainerViewDesktop extends ViewModelWidget<AppContainerViewModel> {
  const AppContainerViewDesktop({required this.child, required this.canvasColor,super.key});
  final Color canvasColor;

  final Widget child;
  @override
  Widget build(BuildContext context, AppContainerViewModel viewModel) {
    return Scaffold(
      backgroundColor:  canvasColor,
      body: Center(
        child: SizedBox(
          width: kdDesktopMaxContentWidth,
          height: double.infinity,
          child: Column(
            children: [
              const HeaderWidget(
                showLogo: true,
                margin: EdgeInsets.only(top: 30, left: 20, right: 20),
                padding:
                    EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
              ),
              verticalSpaceMedium,
              Expanded(
                child: SingleChildScrollView(
                  controller: viewModel.scrollController,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          child,
                          FooterWidget(
                            scrollController: viewModel.scrollController,
                          ),
                          verticalSpaceMassive
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
