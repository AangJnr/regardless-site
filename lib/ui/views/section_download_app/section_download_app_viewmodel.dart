import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';

class SectionDownloadAppViewModel extends BaseViewModel {
  late final AnimationController _controller;
  final UniqueKey _animationKey = UniqueKey();
  UniqueKey get animationKey => _animationKey;
  SectionDownloadAppViewModel(sectionDownloadState) {
    _controller = AnimationController(
        vsync: sectionDownloadState, duration: Duration(milliseconds: 3500));
  }
  AnimationController get controller => _controller;
}
