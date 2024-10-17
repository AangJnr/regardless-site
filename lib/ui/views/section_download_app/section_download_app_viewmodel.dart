import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:visibility_detector/src/visibility_detector.dart';

class SectionDownloadAppViewModel extends BaseViewModel {
  late final AnimationController _controller;
  UniqueKey _animationKey = UniqueKey();
  UniqueKey get animationKey => _animationKey;
  SectionDownloadAppViewModel(sectionDownloadState) {
    _controller = AnimationController(
        vsync: sectionDownloadState, duration: Duration(milliseconds: 3500))
      ..addListener(() {
        rebuildUi();
        print(_controller.value);
      });

    toggleAnimation();
  }
  AnimationController get controller => _controller;
  void toggleAnimation([VisibilityInfo? info]) {
    // if (controller.isAnimating) {
    //   return;
    // }

    Future.delayed(Duration(seconds: 2)).then((v) {
      controller.forward();
    });
    // if (info.visibleFraction < 0.2) {
    //   controller.reverse();
    // } else {
    //   controller.forward();
    // }
  }
}
