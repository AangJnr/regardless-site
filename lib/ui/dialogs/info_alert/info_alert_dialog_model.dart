import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:regardless_site/app/validators.dart';

import '../../../app/app.locator.dart';
import '../../../app/services/toast_service.dart';
import '../../views/base/view_model.dart';

class InfoAlertDialogModel extends ViewModel {
  bool get isValid => Validators.validateEmail(email) == null;

  String email = '';
  void updateEmail(String? value) {
    email = value ?? '';

    rebuildUi();
  }

  sendRequest(String type) {
    setBusy(true);

    runBusyFuture(
      FirebaseFirestore.instance.collection('bookingRequests').add({
        "email": email,
        "requestType": type,
        "requestDate": DateTime.now().toIso8601String()
      }),
    );

    locator<ToastService>().showToast(
      'Your booking request has been successfully submitted. We will get back to you as soon as possible.',
    );
    back();
  }
}
