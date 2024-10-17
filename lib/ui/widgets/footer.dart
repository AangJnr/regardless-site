import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:regardless_site/ui/common/ui_helpers.dart';
import 'package:regardless_site/ui/widgets/footer_bottom.dart';
import 'package:regardless_site/ui/widgets/material_inkwell.dart';
import 'package:regardless_site/ui/widgets/regardless_text.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../app/config/theme_setup.dart';
import '../usecase/links_usecase.dart';
import 'app_logo.dart';
import 'terms_widget.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key, this.scrollController});
  final ScrollController? scrollController;
  @override
  Widget build(BuildContext context) {
    final useCase = LinksUseCase(scrollController: scrollController);
    return Container(
      decoration: BoxDecoration(
          color: AppColors.canvasColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(6), bottomRight: Radius.circular(6))),
      padding: const EdgeInsets.only(bottom: 40, left: 20, right:20),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ScreenTypeLayout.builder(
            desktop: (eContext) => Column(mainAxisSize: MainAxisSize.min, children: [
              Row(
                children: [
                  _buildLogoAndCopyRightWidget(eContext),
                  Spacer(),
                  Expanded(
                    child: _quickLinksColumnOne(eContext, useCase),
                  ),
                  Expanded(
                    child: _quickLinksColumnTwo(eContext, useCase),
                  ),
                  Expanded(
                    child: _quickLinksColumnThree(eContext, useCase),
                  ),
                  _buildScrollToTopWidget(),
                ],
              ),
              verticalSpaceLarge,
              FooterBottomWidget()
            ]),
            mobile: (eContext) => Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: _buildLogoAndCopyRightWidget(eContext)),
                          _buildScrollToTopWidget(),
                        ],
                      ),
                      verticalSpaceMedium,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _quickLinksColumnOne(eContext, useCase),
                          horizontalSpaceMedium,
                          _quickLinksColumnTwo(eContext, useCase),
                          horizontalSpaceMedium,
                          _quickLinksColumnThree(eContext, useCase),
                        ],
                      ),
                    ],
                  ),
                  verticalSpaceLarge,
                  FooterBottomWidget()
                ]),
          );
        },
      ),
    );
  }

  MaterialInkWell _buildScrollToTopWidget() {
    return MaterialInkWell(
      onTap: () => {
        scrollController?.animateTo(0.0,
            duration: Duration(seconds: 1), curve: Curves.easeIn)
      },
      padding: EdgeInsets.all(16),
      color: AppColors.blackColor600,
      radiusValue: 50,
      child: FaIcon(
        FontAwesomeIcons.chevronUp,
        size: 16,
        color: Colors.white70,
      ),
    );
  }

  Column _buildLogoAndCopyRightWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpaceLarge,
        AppLogoWidget(size: const Size(50, 50)),
        verticalSpaceMedium,
        Text(
          'East Legon, Accra-Ghana\ninfo@regardless.com',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.black,
                fontSize: 12,
              ),
        ),
        verticalSpaceLarge
      ],
    );
  }

  Column _quickLinksColumnThree(BuildContext context, LinksUseCase useCase) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 6),
          child: Text(
            'Stay Connected',
            style: Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        const SizedBox(height: 10),
        ...['Instagram', 'Facebook', 'Twitter', 'YouTube'].map(
          (link) => MaterialInkWell(
            paddingValue: 6,
            radiusValue: 6,
            onTap: () => useCase.goToPage(link),
            child: Text(
              link,
              style: Theme.of(context)
                  .primaryTextTheme
                  .labelMedium
                  ?.copyWith(color: AppColors.secondartTextColor),
            ),
          ),
        )
      ],
    );
  }

  Column _quickLinksColumnTwo(BuildContext context, LinksUseCase useCase) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 6),
          child: Text(
            'Discover More',
            style: Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        const SizedBox(height: 10),
        ...['FAQ', 'Sizing Guide', 'Return Policy', 'Contact Us'].map(
          (link) => MaterialInkWell(
            paddingValue: 6,
            radiusValue: 6,
            onTap: () => useCase.goToPage(link),
            child: Text(
              link,
              style: Theme.of(context)
                  .primaryTextTheme
                  .labelMedium
                  ?.copyWith(color: AppColors.secondartTextColor),
            ),
          ),
        )
      ],
    );
  }

  Column _quickLinksColumnOne(BuildContext context, LinksUseCase useCase) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 6),
          child: Text(
            'Quick Links',
            style: Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        const SizedBox(height: 10),
        ...['Home', 'About', 'Shop', 'Contact'].map((link) => MaterialInkWell(
              paddingValue: 6,
              radiusValue: 6,
              onTap: () => useCase.goToPage(link),
              child: Text(
                link,
                style: Theme.of(context)
                    .primaryTextTheme
                    .labelMedium
                    ?.copyWith(color: AppColors.secondartTextColor),
              ),
            )),
      ],
    );
  }

  copyrightTermsPolicyPaymentsWidgetList(BuildContext context) {
    return [
      RegardlessTextWidget(
        text: '© ${DateTime.now().year} Regardless Inc. All Rights Reserved',
        words: ['Regardless', 'Inc.', 'All Rights Reserved'],
        wordsTextStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Colors.black, fontSize: 11, fontWeight: FontWeight.w700),
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.black54,
              fontSize: 11,
            ),
      ),
      TermsAndPrivacyPolicyWidget(
        text: 'Terms of Service     Privacy Policy',
      ),
      _buildPaymentMethodsWidget()
    ];
  }

  Row _buildPaymentMethodsWidget() {
    return Row(
        mainAxisSize: MainAxisSize.min,
        children: ['visa.png', 'mastercard.png', 'momo.png', 'telcel.png']
            .map((e) => Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white),
                child: Image.asset(
                  e,
                  height: 20,
                  width: 30,
                  fit: BoxFit.cover,
                )))
            .toList());
  }
}
