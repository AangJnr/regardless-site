import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      desktop: (_) =>
          _buildDesktopLayout(regardlessText, viewModel, context, false),
      mobile: (_) => OrientationLayoutBuilder(
          landscape: (_) =>
              _buildDesktopLayout(regardlessText, viewModel, context, true),
          portrait: (_) =>
              _buildMobileLayout(regardlessText, context, viewModel)),
    );
  }

  Center _buildMobileLayout(RegardlessText regardlessText, BuildContext context,
      InfoAlertDialogModel viewModel) {
    return Center(
      child: Container(
        color: Colors.white,
        constraints: BoxConstraints(maxHeight: 600),
        margin: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(
              regardlessText.imageAsset!,
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Material(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
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
            )
          ],
        ),
      ),
    );
  }

  Center _buildDesktopLayout(RegardlessText regardlessText,
      InfoAlertDialogModel viewModel, BuildContext context, bool isMobile) {
    return Center(
      child: SizedBox(
        width: isMobile
            ? (screenWidth(context) - 60)
            : kdDesktopMaxContentWidth / 1.5,
        height: isMobile
            ? (screenHeight(context) - 40)
            : kdDesktopMaxContentHeight / 2,
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
                      spacingLarge(isMobile),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: isMobile ? 20 : 60),
                        child: Text(
                          'Booking Request',
                          style: Theme.of(context)
                              .primaryTextTheme
                              .displaySmall
                              ?.copyWith(fontSize: isMobile ? 22 : 50),
                        ),
                      ),
                      spacingLarge(isMobile),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: isMobile ? 20 : 60),
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
                      spacingMedium(isMobile),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: isMobile ? 20 : 60),
                        child: LabeledFormField(
                          label: 'Enter your email address',
                          onChanged: viewModel.updateEmail,
                          initialValue: viewModel.email,
                        ),
                      ),
                      spacingMedium(isMobile),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: isMobile ? 20 : 60),
                        child: PrimaryButtonWidget(
                          viewModel.isValid
                              ? () => viewModel.sendRequest(regardlessText.text)
                              : null,
                          textLabel: 'Send Request',
                          isLoading: viewModel.isBusy,
                          isFullWidth: true,
                        ),
                      ),
                      spacingMedium(isMobile),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: isMobile ? 20 : 60),
                        child: SocialsWidget(),
                      ),
                      spacingLarge(isMobile)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget spacingMedium(bool isMobile) =>
      isMobile ? SizedBox(height: 10) : verticalSpaceMedium;
  Widget spacingLarge(bool isMobile) =>
      isMobile ? SizedBox(height: 20) : verticalSpaceLarge;

  @override
  InfoAlertDialogModel viewModelBuilder(BuildContext context) =>
      InfoAlertDialogModel();
}
