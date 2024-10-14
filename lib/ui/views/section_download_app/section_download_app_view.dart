import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:lottie/lottie.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../app/config/theme_setup.dart';
import '../../common/ui_helpers.dart';
import '../../widgets/regardless_text.dart';
import 'section_download_app_viewmodel.dart';

class SectionDownloadAppView extends StatefulWidget {
  const SectionDownloadAppView({super.key});

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
    _viewModel.controller.addListener(() {
      setState(() {
        // Rebuild the widget at each frame to update the "progress" label.
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (_) => VisibilityDetector(
        key: Key('SectionDownloadAppView'),
        onVisibilityChanged: _viewModel.toggleAnimation,
        child: Column(
          children: [
            Container(
              color: Colors.black,
              padding: EdgeInsets.only(top: 100),
              child: Row(
                children: [
                  horizontalSpaceMassive,
                  Expanded(
                      child: Column(children: [
                    RegardlessTextWidget(
                      text: 'Stay Connected and Active with the Regardless App',
                      textAlign: TextAlign.left,
                      words: ['Regardless'],
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(color: Colors.white, fontSize: 45),
                    ),
                    verticalSpaceMedium,
                    Text(
                      'Discover events, join communities, and manage your sports journey with ease. Download the Regardless app on Play Store or App Store and never miss out!',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: AppColors.secondartTextColor),
                    ),
                    verticalSpaceLarge,
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1.5, color: Colors.white70),
                                  borderRadius: BorderRadius.circular(6)),
                              child: Image.asset(
                                height: 70,
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
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1.5, color: Colors.white70),
                                    borderRadius: BorderRadius.circular(6)),
                                child: Image.asset(
                                  height: 70,
                                  'assets/google_play.png',
                                  fit: BoxFit.fitWidth,
                                )),
                          ),
                        )
                      ],
                    )
                  ])),
                  Expanded(
                      flex: 2,
                      child: SizedBox(
                          width: double.infinity,
                          height: 700,
                          child: ClipRRect(
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
                                      _viewModel.controller.duration =
                                          composition.duration;
                                    },
                                  )))))
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: largeSize,
              ),
              color: AppColors.accentColor,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    horizontalSpaceLarge,
                    ...texts
                        .map((e) => Container(
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: AppColors.whiteColor.withOpacity(0.8),
                              ),
                              padding: EdgeInsets.all(20),
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              child: RegardlessTextWidget(
                                text: e.text,
                                words: e.words,
                                textAlign: TextAlign.start,
                                wordsTextStyle: Theme.of(context)
                                    .textTheme
                                    .headlineLarge
                                    ?.copyWith(
                                        color: Colors.black, fontSize: 35),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        color: Colors.black87, fontSize: 10),
                              ),
                            ))
                        .toList(),
                    horizontalSpaceLarge
                  ]),
            ),
          ],
        ),
      ),
    );
  }

  List<RegardlessText> texts = [
    RegardlessText(
        text: '1,203\nCommunities added since 2024', words: ['1,203']),
    RegardlessText(
        text: '15,432\nActive members connecting and engaging',
        words: ['15,432']),
    RegardlessText(text: '986\nEvents hosted this year', words: ['986']),
    RegardlessText(
        text: '450plus\nCertified trainers ready to help you', words: ['450+']),
    RegardlessText(
        text: '8,250\nEvent bookings made in 2024', words: ['8,250']),
  ];
}

class RegardlessText {
  String text;
  List<String> words;
  String? imageAsset;
  RegardlessText({required this.text, required this.words, this.imageAsset});
}
