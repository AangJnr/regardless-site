import 'package:regardless_site/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';

import '../section_download_app/section_download_app_view.dart';

class SectionSessionsInfoViewModel extends BaseViewModel {
  final List<RegardlessText> texts = [
    RegardlessText(
        text: kIndividualTrainingText,
        words: ['Individual Training'],
        imageAsset: 'assets/individual.jpeg'),
    RegardlessText(
        text: kGroupTrainingText,
        words: ['Group Training'],
        imageAsset: 'assets/group.jpeg'),
    RegardlessText(
        text: kCorporateTrainingText,
        words: ['Corporate Training'],
        imageAsset: 'assets/coporate.jpeg'),
  ];
}
