import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:regardless_site/ui/widgets/labeled_form_field.dart';
import 'package:regardless_site/ui/widgets/primary_button_widget.dart';
import 'package:stacked/stacked.dart';

import '../../../app/config/theme_setup.dart';
import '../../common/app_strings.dart';
import '../../common/ui_helpers.dart';
import '../../widgets/labeled_form_field_multi.dart';
import '../../widgets/material_inkwell.dart';
import '../../widgets/regardless_text.dart';
import '../../widgets/terms_widget.dart';
import 'section_contact_us_viewmodel.dart';

class SectionContactUsViewDesktop
    extends ViewModelWidget<SectionContactUsViewModel> {
  const SectionContactUsViewDesktop({super.key});

  @override
  Widget build(BuildContext context, SectionContactUsViewModel viewModel) {
    return Container(
      color: AppColors.whiteColor,
      padding: EdgeInsets.symmetric(
          vertical: getResponsiveVerticalSpaceMedium(context)),
      child: Row(
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
                Row(
                    children: [
                  Icon("Facebook", FontAwesomeIcons.facebook),
                  Icon("Instagram", FontAwesomeIcons.instagram),
                  Icon("Twitter", FontAwesomeIcons.twitter),
                  Icon("YouTube", FontAwesomeIcons.youtube),
                  Icon("WhatsApp", FontAwesomeIcons.whatsapp),
                ]
                        .map((e) => MaterialInkWell(
                            onTap: () {
                              viewModel.linkUseCase.goToPage(e.text);
                            },
                            radiusValue: 50,
                            padding: EdgeInsets.all(10),
                            child: FaIcon(
                              e.icon,
                              color: AppColors.blackColor600,
                              size: 15,
                            )))
                        .toList())
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
                      )),
                      horizontalSpaceMedium,
                      Expanded(
                          child: LabeledFormField(
                        label: "Phone (eg. + 233 200 000 000)",
                      ))
                    ],
                  ),
                  verticalSpaceMedium,
                  LabeledFormField(
                    label: "Email",
                    isRequired: true,
                  ),
                  verticalSpaceMedium,
                  MultiLineLabeledFormField(
                    label: "Please leave us a message",
                    isRequired: true,
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
                      () {},
                      textLabel: 'Submit',
                    )
                  ]),
                ],
              ),
            ),
          ),
          horizontalSpaceMassive,
        ],
      ),
    );
  }
}

class Icon {
  final String text;
  final IconData icon;
  Icon(this.text, this.icon);
}
