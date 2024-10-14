import 'package:flutter/widgets.dart';
import 'package:regardless_site/app/app.bottomsheets.dart';
import 'package:regardless_site/app/app.dialogs.dart';
import 'package:regardless_site/app/app.locator.dart';
import 'package:regardless_site/ui/common/app_strings.dart';
import 'package:regardless_site/ui/views/section_download_app/section_download_app_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../base/view_model.dart';

class HomeViewModel extends ViewModel {
  final downloadSection = locator<SectionDownloadAppView>();

  String get counterLabel => 'Counter is: $_counter';
  final ScrollController scrollController = ScrollController();

  int _counter = 0;

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }

  void showDialog() {
    dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Stacked Rocks!',
      description: 'Give stacked $_counter stars on Github',
    );
  }

  void showBottomSheet() {
    bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }
}
