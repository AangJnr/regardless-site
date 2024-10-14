import 'package:flutter/material.dart';
import 'package:regardless_site/ui/widgets/labeled_form_field.dart';
import 'package:regardless_site/ui/widgets/primary_button_widget.dart';
import 'package:regardless_site/ui/widgets/regardless_text.dart';
import 'package:regardless_site/ui/widgets/terms_widget.dart';

import '../../app/config/theme_setup.dart';
import '../common/app_strings.dart';
import '../common/ui_helpers.dart';
import 'primary_button_outline_widget.dart';

class NewsletterWidget extends StatelessWidget {
  const NewsletterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.canvasColorAlt,
      padding: const EdgeInsets.symmetric(vertical: massiveSize),
      child: Row(
        children: [
          const Spacer(
            flex: 1,
          ),
          Flexible(
              flex: 2,
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
                    ?.copyWith(color: AppColors.accentColorText, fontSize: 30),
              )),
          horizontalSpaceLarge,
          Flexible(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                          width: 350,
                          child: LabeledFormField(
                            label: 'Your E-mail',
                          )),
                      horizontalSpaceSmall,
                      PrimaryButtonOutlineWidget(
                        () {},
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
    );
  }
}
