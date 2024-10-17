import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:regardless_site/ui/common/app_colors.dart';
import 'package:regardless_site/ui/common/ui_helpers.dart';
import 'package:regardless_site/ui/views/section_download_app/section_download_app_view.dart';
import 'package:regardless_site/ui/widgets/labeled_form_field.dart';
import 'package:regardless_site/ui/widgets/material_inkwell.dart';
import 'package:regardless_site/ui/widgets/primary_button_widget.dart';
import 'package:regardless_site/ui/widgets/regardless_text.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/config/theme_setup.dart';
import '../../common/app_constants.dart';
import '../../widgets/social_widget.dart';
import 'info_alert_dialog_model.dart';

const double _graphicSize = 60;

class InfoAlertDialog extends StackedView<InfoAlertDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const InfoAlertDialog({
    super.key,
    required this.request,
    required this.completer,
  });

  @override
  Widget builder(
    BuildContext context,
    InfoAlertDialogModel viewModel,
    Widget? child,
  ) {
    final regardlessText = request.data as RegardlessText;
    return ScreenTypeLayout.builder(
      desktop: (_) => Center(
        child: SizedBox(
          width: kdDesktopMaxContentWidth / 1.5,
          height: kdDesktopMaxContentHeight / 2,
          child: Row(
            children: [
              Expanded(
                  flex: 4,
                  child: Image.asset(
                    regardlessText.imageAsset!,
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                  )),
              Expanded(
                flex: 5,
                child: Material(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Spacer(),
                          MaterialInkWell(
                            radiusValue: 20,
                            padding: EdgeInsets.all(16),
                            onTap: viewModel.back,
                            child: FaIcon(
                              FontAwesomeIcons.xmark,
                              size: 20,
                            ),
                          )
                        ],
                      ),
                      verticalSpaceMedium,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60),
                        child: Text(
                          'Booking Request',
                          style: Theme.of(context)
                              .primaryTextTheme
                              .displaySmall
                              ?.copyWith(fontSize: 50),
                        ),
                      ),
                      verticalSpaceLarge,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60),
                        child: RegardlessTextWidget(
                          textAlign: TextAlign.start,
                          words: [regardlessText.text],
                          text:
                              'Please enter your email address to finalize your booking for ${regardlessText.text}. Our team will be in touch shortly to confirm your request and provide further details.',
                          wordsTextStyle: Theme.of(context)
                              .primaryTextTheme
                              .bodyMedium
                              ?.copyWith(
                                  fontSize: 13,
                                  color: AppColors.blackColor600,
                                  fontWeight: FontWeight.bold),
                          style: Theme.of(context)
                              .primaryTextTheme
                              .bodyMedium
                              ?.copyWith(
                                  fontSize: 13, color: AppColors.blackColor600),
                        ),
                      ),
                      verticalSpaceMedium,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60),
                        child: LabeledFormField(
                          label: 'Enter your email address',
                          onChanged: viewModel.updateEmail,
                          initialValue: viewModel.email,
                        ),
                      ),
                      verticalSpaceMedium,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60),
                        child: PrimaryButtonWidget(
                          viewModel.isValid
                              ? () => viewModel.sendRequest(regardlessText.text)
                              : null,
                          textLabel: 'Send Request',
                          isLoading: viewModel.isBusy,
                          isFullWidth: true,
                        ),
                      ),
                      verticalSpaceMedium,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60),
                        child: SocialsWidget(),
                      ),
                      verticalSpaceLarge
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      mobile: (_) => Center(
        child: Container(color: Colors.white,
          constraints: BoxConstraints(maxHeight: 400),
          margin: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                  flex: 4,
                  child: Image.asset(
                    regardlessText.imageAsset!,
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                  )),
              Expanded(
                flex: 5,
                child: Material(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Spacer(),
                            MaterialInkWell(
                              radiusValue: 20,
                              padding: EdgeInsets.all(16),
                              onTap: viewModel.back,
                              child: FaIcon(
                                FontAwesomeIcons.xmark,
                                size: 20,
                              ),
                            )
                          ],
                        ),
                         Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            'Booking Request',
                            style: Theme.of(context)
                                .primaryTextTheme
                                .displaySmall
                                ?.copyWith(fontSize: 25),
                          ),
                        ),
                        verticalSpaceMedium,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: RegardlessTextWidget(
                            textAlign: TextAlign.start,
                            words: [regardlessText.text],
                            text:
                                'Please enter your email address to finalize your booking for ${regardlessText.text}. Our team will be in touch shortly to confirm your request and provide further details.',
                            wordsTextStyle: Theme.of(context)
                                .primaryTextTheme
                                .bodyMedium
                                ?.copyWith(
                                    fontSize: 13,
                                    color: AppColors.blackColor600,
                                    fontWeight: FontWeight.bold),
                            style: Theme.of(context)
                                .primaryTextTheme
                                .bodyMedium
                                ?.copyWith(
                                    fontSize: 13, color: AppColors.blackColor600),
                          ),
                        ),
                        verticalSpaceSmall,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: LabeledFormField(
                            label: 'Enter your email address',
                            onChanged: viewModel.updateEmail,
                            initialValue: viewModel.email,
                          ),
                        ),
                        verticalSpaceSmall,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: PrimaryButtonWidget(
                            viewModel.isValid
                                ? () => viewModel.sendRequest(regardlessText.text)
                                : null,
                            textLabel: 'Send Request',
                            isLoading: viewModel.isBusy,
                            isFullWidth: true,
                          ),
                        ),
                        verticalSpaceSmall,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: SocialsWidget(),
                        ),
                        verticalSpaceSmall
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  InfoAlertDialogModel viewModelBuilder(BuildContext context) =>
      InfoAlertDialogModel();
}
