import 'package:flutter/material.dart';
import 'package:regardless_site/extensions/hover_extensions.dart';
import 'package:regardless_site/ui/usecase/links_usecase.dart';
import 'package:regardless_site/ui/views/app_container/app_container_view.dart';
import 'package:regardless_site/ui/widgets/header.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:lottie/lottie.dart';

import '../../../app/config/theme_setup.dart';
import '../../common/ui_helpers.dart';
import '../../widgets/regardless_text.dart';
import 'section_download_app_viewmodel.dart';

class SectionDownloadAppView extends StatefulWidget {
  const SectionDownloadAppView({super.key});

  @override
  State<SectionDownloadAppView> createState() => _SectionDownloadState();
}

class _SectionDownloadState extends State<SectionDownloadAppView>
    with TickerProviderStateMixin {
  late final SectionDownloadAppViewModel _viewModel;
  double fraction = 0.0;
  @override
  void initState() {
    super.initState();

    _viewModel = SectionDownloadAppViewModel(this);
  }

  @override
  Widget build(BuildContext context) {
    return AppContainerView(
      child: ScreenTypeLayout.builder(
        mobile: (_) => Container(
          color: Colors.black,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: _buildTitleWidget(context, true),
            ),
            _buildMockupWidget(),
            BuildMetricsWidget(),
          ]),
        ),
        desktop: (_) => Column(
          children: [
            Container(
              color: Colors.black,
              padding: EdgeInsets.only(top: 100, left: largeSize + 20),
              child: Row(
                children: [
                  Expanded(child: _buildTitleWidget(context, false)),
                  Expanded(
                      flex: 2,
                      child: SizedBox(
                          width: double.infinity,
                          height: 700,
                          child: _buildMockupWidget()))
                ],
              ),
            ),
            BuildMetricsWidget(),
          ],
        ),
      ),
    );
  }

  Column _buildTitleWidget(BuildContext context, bool isMobile) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpaceLarge,
          RegardlessTextWidget(
            text: 'Stay Connected and Active with the Regardless App',
            textAlign: TextAlign.start,
            words: ['Regardless'],
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(color: Colors.white, fontSize: isMobile ? 22 : 45),
          ),
          verticalSpaceMedium,
          Text(
            'Discover events, join communities, and manage your sports journey with ease. Download the Regardless app on Play Store or App Store and never miss out!',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.secondartTextColor,
                fontSize: isMobile ? 13 : 15),
          ),
          verticalSpaceMedium,
          _buildAppStoreIconsWidget(isMobile),
          verticalSpaceMedium
        ]);
  }

  Row _buildAppStoreIconsWidget(bool isMobile) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
             LinksUseCase().openLink(
                'https://testflight.apple.com/join/ZumJqcbz');
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              height: isMobile ? 50 : 70,
              width: isMobile ? 50 : 70,
              'assets/apple_store_icon.png',
              fit: BoxFit.fitHeight,
            ),
          ),
        ).scaleOnHover(),
        horizontalSpaceMedium,
        GestureDetector(
          onTap: () {
            LinksUseCase().openLink(
                'https://play.google.com/store/apps/details?id=com.regardless.social_app');
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              'assets/google_play_icon.png',
              fit: BoxFit.fitHeight,
              height: isMobile ? 50 : 70,
              width: isMobile ? 50 : 70,
            ),
          ),
        ).scaleOnHover(),
        horizontalSpaceSmall,
      ],
    );
  }

  Widget _buildMockupWidget() {
    return ClipRRect(
      child: Image.asset(
        'assets/scene_1.png',
        fit: BoxFit.fitWidth,
      ),
    );
  }

  @override
  void dispose() {
    _viewModel.controller.dispose();
    super.dispose();
  }
}

class BuildMetricsWidget extends StatelessWidget {
  const BuildMetricsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (_) => Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: largeSize),
        color: AppColors.accentColor,
        child: Wrap(children: [
          ...[
            RegardlessText(
                text: '1,203\nCommunities added since 2024', words: ['1,203']),
            RegardlessText(
                text: '15,432\nActive members connecting and engaging',
                words: ['15,432']),
            RegardlessText(
                text: '986\nEvents hosted this year', words: ['986']),
            RegardlessText(
                text: '450plus\nCertified trainers ready to help you',
                words: ['450+']),
            RegardlessText(
                text: '8,250\nEvent bookings made in 2024', words: ['8,250']),
          ].map((e) => Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.whiteColor.withOpacity(0.8),
                ),
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(20),
                child: RegardlessTextWidget(
                  text: e.text,
                  words: e.words,
                  textAlign: TextAlign.start,
                  wordsTextStyle: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(color: Colors.black, fontSize: 35),
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.black87, fontSize: 10),
                ),
              )),
        ]),
      ),
      mobile: (_) => Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        color: AppColors.accentColor,
        child: Wrap(children: [
          ...[
            RegardlessText(
                text: '1,203\nCommunities added since 2024', words: ['1,203']),
            RegardlessText(
                text: '15,432\nActive members connecting and engaging',
                words: ['15,432']),
            RegardlessText(
                text: '986\nEvents hosted this year', words: ['986']),
            RegardlessText(
                text: '450plus\nCertified trainers ready to help you',
                words: ['450+']),
            RegardlessText(
                text: '8,250\nEvent bookings made in 2024', words: ['8,250']),
          ].map((e) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: AppColors.whiteColor.withOpacity(0.8),
                ),
                width: 150,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                child: RegardlessTextWidget(
                  text: e.text,
                  words: e.words,
                  textAlign: TextAlign.start,
                  wordsTextStyle: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(color: Colors.black, fontSize: 20),
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.black87, fontSize: 10),
                ),
              )),
        ]),
      ),
    );
  }
}

class RegardlessText {
  String text;
  List<String> words;
  String? imageAsset;
  RegardlessText({required this.text, this.words = const [], this.imageAsset});
}
