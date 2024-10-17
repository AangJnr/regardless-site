import 'package:regardless_site/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../usecase/links_usecase.dart';

class ViewModel extends BaseViewModel {
  final linkUseCase = LinksUseCase();
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _navigationService = locator<RouterService>();

  DialogService get dialogService => _dialogService;
  BottomSheetService get bottomSheetService => _bottomSheetService;
  RouterService get navigationService => _navigationService;
  goToTermsView() {
    navigationService.navigateToTerms();
  }

  goToPolicyView() {
    navigationService.navigateToPolicy();
  }

  back() {
    navigationService.back();
  }
}
