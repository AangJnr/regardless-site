import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:regardless_site/ui/views/section_contact_us/section_contact_us_view.form.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import '../../../app/services/toast_service.dart';
import '../../../data/user_query.dart';
import '../../usecase/links_usecase.dart';

class SectionContactUsViewModel extends FormViewModel {
  final linkUseCase = LinksUseCase();

  void saveQuery() async {
    validateForm();
    if (!isFormValid) {
      Future.delayed(Duration(seconds: 2)).then((v) {
        fieldsValidationMessages.clear();

        rebuildUi();
      });
      return;
    }
    setBusy(true);
    final query = UserQuery(
      name: nameValue,
      email: emailValue!.trim(),
      message: messageValue!,
      phoneNumber: phoneNumberValue,
    );

    runBusyFuture(
      FirebaseFirestore.instance
          .collection('userQueries')
          .doc(query.email)
          .set(query.toMap()),
    );

    locator<ToastService>().showToast(
      'Thank you for your message. We will get back to you soon.',
    );
  }
}
