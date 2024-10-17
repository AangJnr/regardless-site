import 'package:flutter/material.dart';
import 'package:regardless_site/ui/views/app_container/app_container_view.dart';
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  children: [
                    Expanded(flex: 2, child: _buildTitleWidget(context, true)),
                    Expanded(
                      flex: 3,
                      child: _buildMockupWidget(),
                    ),
                  ],
                ),
              ),
              BuildMetricsWidget(),
            ],
          ),
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
                ?.copyWith(color: Colors.white, fontSize: isMobile ? 18 : 45),
          ),
          verticalSpaceMedium,
          Text(
            'Discover events, join communities, and manage your sports journey with ease. Download the Regardless app on Play Store or App Store and never miss out!',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.secondartTextColor,
                fontSize: isMobile ? 13 : 15),
          ),
          verticalSpaceLarge,
          _buildAppStoreIconsWidget(isMobile),
          verticalSpaceMedium
        ]);
  }

  Row _buildAppStoreIconsWidget(bool isMobile) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                  border: Border.all(width: 1.5, color: Colors.white70),
                  borderRadius: BorderRadius.circular(6)),
              child: Image.asset(
                height: isMobile ? 50 : 70,
                width: isMobile ? 150 : double.infinity,
                'assets/apple_store.png',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ),
        horizontalSpaceMedium,
        Expanded(
          child: GestureDetector(
            onTap: () {},
            child: Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                    border: Border.all(width: 1.5, color: Colors.white70),
                    borderRadius: BorderRadius.circular(6)),
                child: Image.asset(
                  height: isMobile ? 50 : 70,
                  width: isMobile ? 150 : double.infinity,
                  'assets/google_play.png',
                  fit: BoxFit.fitWidth,
                )),
          ),
        )
      ],
    );
  }

  ClipRRect _buildMockupWidget() {
    return ClipRRect(
        child: Opacity(
            opacity: _viewModel.controller.value,
            child: Lottie.asset(
              key: _viewModel.animationKey,
              'assets/r_mockup.json',
              repeat: false,
              fit: BoxFit.fitHeight,
              controller: _viewModel.controller,
              onLoaded: (composition) {
                // Configure the AnimationController with the duration of the
                _viewModel.controller.duration = composition.duration;
                _viewModel.toggleAnimation();
              },
            )));
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
