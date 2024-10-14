import '../../common/app_strings.dart';
import '../base/view_model.dart';

class TermsViewModel extends ViewModel {
  String get data => navigationService.router.current.path.contains("terms")
      ? kTermsAndConditionsText
      : kPrivacyPolicyText;

  List<String> get words =>
      navigationService.router.current.path.contains("terms")
          ? kTermsAndConditionsWords
          : kPrivacyPolicyWords;
  String get title => navigationService.router.current.path.contains("terms")
      ? 'Terms and Conditions'
      : 'Privacy Policy';
}
