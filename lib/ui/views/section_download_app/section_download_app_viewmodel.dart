import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:visibility_detector/src/visibility_detector.dart';

class SectionDownloadAppViewModel extends BaseViewModel {
  late final AnimationController _controller;
  UniqueKey _animationKey = UniqueKey();
  UniqueKey get animationKey => _animationKey;
  SectionDownloadAppViewModel(_sectionDownloadState) {
    _controller = AnimationController(
        vsync: _sectionDownloadState, duration: Duration(milliseconds: 3500));
  }
  AnimationController get controller => _controller;

  void toggleAnimation(VisibilityInfo info) {
    if (controller.isAnimating) {
      return;
    }
    if (info.visibleFraction < 0.2) {
      controller.reverse();
    } else {
      controller.forward();
    }
  }
}
