import 'package:regardless_site/ui/common/app_strings.dart';

import '../../../app/app.dialogs.dart';
import '../base/view_model.dart';
import '../section_download_app/section_download_app_view.dart';

class SectionSessionsInfoViewModel extends ViewModel {
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

  showBookNowDialog(RegardlessText r) {
    dialogService.showCustomDialog(
        variant: DialogType.infoAlert,
        data: RegardlessText(
            text: r.words.fold('', (acc, b) => '$acc $b').trim(), imageAsset: r.imageAsset));
  }
}
