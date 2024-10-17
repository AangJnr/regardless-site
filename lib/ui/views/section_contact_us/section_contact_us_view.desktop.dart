import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:regardless_site/ui/widgets/labeled_form_field.dart';
import 'package:regardless_site/ui/widgets/newsletter_widget.dart';
import 'package:regardless_site/ui/widgets/primary_button_widget.dart';
import 'package:stacked/stacked.dart';

import '../../../app/config/theme_setup.dart';
import '../../common/app_strings.dart';
import '../../common/ui_helpers.dart';
import '../../widgets/labeled_form_field_multi.dart';
import '../../widgets/regardless_text.dart';
import '../../widgets/social_widget.dart';
import '../../widgets/terms_widget.dart';
import 'section_contact_us_view.form.dart';
import 'section_contact_us_viewmodel.dart';

class SectionContactUsViewDesktop
    extends ViewModelWidget<SectionContactUsViewModel>
    with $SectionContactUsView {
  const SectionContactUsViewDesktop({super.key});

  @override
  Widget build(BuildContext context, SectionContactUsViewModel viewModel) {
    return Container(
      color: AppColors.whiteColor,
      padding: EdgeInsets.only(
          top: largeSize),
      child: Column(
        children: [
          Row(
            children: [
              horizontalSpaceMassive,
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RegardlessTextWidget(
                      text: 'Let\'s Get In Touch',
                      words: ['Touch'],
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(color: AppColors.blackColor, fontSize: 45),
                      wordsTextStyle: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(
                              color: AppColors.accentColorText, fontSize: 45),
                    ),
                    verticalSpaceMedium,
                    Text(
                      'We’d love to hear from you! Whether you have questions, feedback, or just want to say hello, feel free to reach out. Our team is always here to assist you with any inquiries. Fill out the form below or contact us through any of our channels, and we’ll get back to you as soon as possible!',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: AppColors.blackColor),
                    ),
                    verticalSpaceLarge,
                    SocialsWidget()
                  ],
                ),
              ),
              horizontalSpaceMassive,
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpaceLarge,
                      Row(
                        children: [
                          Expanded(
                              child: LabeledFormField(
                            label: "First name, Last Name",
                            isRequired: true,
                            controller: nameController,
                            hasError: viewModel.hasNameValidationMessage,
                            errorMessage: viewModel.nameValidationMessage,
                          )),
                          horizontalSpaceMedium,
                          Expanded(
                              child: LabeledFormField(
                            label: "Phone (eg. + 233 200 000 000)",
                            controller: nameController,
                          ))
                        ],
                      ),
                      verticalSpaceMedium,
                      LabeledFormField(
                        label: "Email",
                        isRequired: true,
                        controller: emailController,
                        hasError: viewModel.hasEmailValidationMessage,
                        errorMessage: viewModel.emailValidationMessage,
                      ),
                      verticalSpaceMedium,
                      MultiLineLabeledFormField(
                        label: "Please leave us a message",
                        isRequired: true,
                        controller: messageController,
                        hasError: viewModel.hasMessageValidationMessage,
                        errorMessage: viewModel.messageValidationMessage,
                      ),
                      verticalSpaceMedium,
                      Row(children: [
                        Flexible(
                            child: TermsAndPrivacyPolicyWidget(
                          text: kContactUsRationaleText,
                          textAlign: TextAlign.start,
                        )),
                        horizontalSpaceMassive,
                        PrimaryButtonWidget(
                          viewModel.saveQuery,
                          isLoading: viewModel.isBusy,
                          textLabel: 'Submit',
                        )
                      ]),
                    ],
                  ),
                ),
              ),
              horizontalSpaceMassive,
            ],
          ),verticalSpaceLarge,
          NewsletterWidget()
        ],
      ),
    );
  }
}
