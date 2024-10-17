import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:regardless_site/ui/widgets/labeled_form_field.dart';
import 'package:regardless_site/ui/widgets/primary_button_widget.dart';
import 'package:regardless_site/ui/widgets/regardless_text.dart';
import 'package:regardless_site/ui/widgets/terms_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import '../../app/app.locator.dart';
import '../../app/config/theme_setup.dart';
import '../../app/services/toast_service.dart';
import '../../app/validators.dart';
import '../common/app_strings.dart';
import '../common/ui_helpers.dart';
import '../views/base/view_model.dart';
import 'primary_button_outline_widget.dart';

class NewsletterWidget extends StackedView<NewsLetterViewModel> {
  const NewsletterWidget({super.key});

  @override
  Widget builder(
    BuildContext context,
    NewsLetterViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => Container(
        color: AppColors.canvasColorAlt,
        padding: const EdgeInsets.symmetric(vertical: largeSize),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              verticalSpaceSmall,
              RegardlessTextWidget(
                textAlign: TextAlign.start,
                text: 'Sign Up to Our Newsletter and Get Special Offers',
                words: ['Newsletter', 'Special Offers'],
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(color: AppColors.blackColor, fontSize: 18),
                wordsTextStyle: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(color: AppColors.accentColorText, fontSize: 18),
              ),
              verticalSpaceMedium,
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: LabeledFormField(
                      label: 'Your E-mail',
                      onChanged: viewModel.setEmail,
                      hasError: viewModel.emailError != null,
                      errorMessage: viewModel.emailError,
                    ),
                  ),
                  horizontalSpaceSmall,
                  Expanded(
                    flex: 2,
                    child: PrimaryButtonOutlineWidget(
                      viewModel.isValid ? viewModel.subscribe : null,
                      textLabel: 'Subscribe',
                      isFullWidth: false,
                    ),
                  ),
                ],
              ),
              verticalSpaceTiny,
              TermsAndPrivacyPolicyWidget(
                text: kSubscribeNewsletterRationaleText,
                textAlign: TextAlign.start,
              ),
              verticalSpaceSmall
            ],
          ),
        ),
      ),
      desktop: (_) => Container(
        color: AppColors.canvasColorAlt,
        padding: const EdgeInsets.symmetric(vertical: massiveSize),
        child: Row(
          children: [
            const Spacer(
              flex: 1,
            ),
            Flexible(
                flex: 3,
                child: RegardlessTextWidget(
                  textAlign: TextAlign.start,
                  text: 'Sign Up to Our Newsletter and Get Special Offers',
                  words: ['Newsletter', 'Special Offers'],
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(color: AppColors.blackColor, fontSize: 30),
                  wordsTextStyle: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(
                          color: AppColors.accentColorText, fontSize: 30),
                )),
            horizontalSpaceLarge,
            Flexible(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                            width: 300,
                            child: LabeledFormField(
                              label: 'Your E-mail',
                              onChanged: viewModel.setEmail,
                              hasError: viewModel.emailError != null,
                              errorMessage: viewModel.emailError,
                            )),
                        horizontalSpaceSmall,
                        PrimaryButtonOutlineWidget(
                          viewModel.isValid ? viewModel.subscribe : null,
                          textLabel: 'Subscribe',
                          isFullWidth: false,
                        ),
                      ],
                    ),
                    verticalSpaceTiny,
                    TermsAndPrivacyPolicyWidget(
                      text: kSubscribeNewsletterRationaleText,
                      textAlign: TextAlign.start,
                    )
                  ],
                )),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }

  @override
  NewsLetterViewModel viewModelBuilder(BuildContext context) =>
      NewsLetterViewModel();
}

class NewsLetterViewModel extends ViewModel {
  String email = '';
  String? emailError;
  void setEmail(String? value) {
    email = value ?? '';
    emailError = Validators.validateEmail(email);
    rebuildUi();
  }

  bool get isValid => email.isNotEmpty && emailError == null;

  void subscribe() {
    runBusyFuture(FirebaseFirestore.instance
        .collection('newsletter')
        .doc(email)
        .set({'dateSubscribed': DateTime.now().toIso8601String()}));

    locator<ToastService>()
        .showToast('Thank you for subscribing to our newsletter');
  }
}
