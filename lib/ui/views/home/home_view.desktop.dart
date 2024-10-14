import 'package:regardless_site/app/config/theme_setup.dart';
import 'package:regardless_site/ui/common/app_colors.dart';
import 'package:regardless_site/ui/common/app_constants.dart';
import 'package:regardless_site/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:regardless_site/ui/views/section_download_app/section_download_app_view.dart';
import 'package:regardless_site/ui/views/section_featured/section_featured_view.dart';
import 'package:regardless_site/ui/views/section_sessions_info/section_sessions_info_view.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/footer.dart';
import '../../widgets/header.dart';
import '../../widgets/newsletter_widget.dart';
import '../section_contact_us/section_contact_us_view.dart';
import 'home_viewmodel.dart';

class HomeViewDesktop extends ViewModelWidget<HomeViewModel> {
  const HomeViewDesktop({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: Center(
          child: SizedBox(
              width: kdDesktopMaxContentWidth,
              height: double.infinity,
              child: Column(
                children: [
                  const HeaderWidget(
                    margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
                    padding: const EdgeInsets.only(
                        left: 30, right: 30, top: 20, bottom: 20),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      controller: viewModel.scrollController,
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                  child: Image.asset(
                                'assets/header2.jpeg',
                                fit: BoxFit.fitWidth,
                                height: 320,
                                width: double.infinity,
                              )),
                              const SectionSessionsInfoView(),
                              const SectionFeaturedView(),
                              viewModel.downloadSection,
                              const SectionContactUsView(),
                              const NewsletterWidget(),
                              FooterWidget(
                                scrollController: viewModel.scrollController,
                              ),
                              verticalSpaceMassive
                            ],
                          )),
                    ),
                  ),
                ],
              )),
        ));
  }
}
