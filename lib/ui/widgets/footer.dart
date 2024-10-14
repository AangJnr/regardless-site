import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:regardless_site/ui/common/ui_helpers.dart';
import 'package:regardless_site/ui/widgets/material_inkwell.dart';
import 'package:regardless_site/ui/widgets/regardless_text.dart';

import '../../app/config/theme_setup.dart';
import '../usecase/links_usecase.dart';
import 'app_logo.dart';
import 'terms_widget.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({Key? key, this.scrollController}) : super(key: key);
  final ScrollController? scrollController;
  @override
  Widget build(BuildContext context) {
    final useCase = LinksUseCase(scrollController: scrollController);
    final currentYear = DateTime.now().year;
    return Container(
      decoration: BoxDecoration(
          color: AppColors.canvasColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(6), bottomRight: Radius.circular(6))),
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: largeSize),
              child: Column(children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        verticalSpaceLarge,
                        AppLogoWidget(size: const Size(50, 50)),
                        verticalSpaceMedium,
                        Text(
                          'East Legon, Accra-Ghana\ninfo@regardless.com',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                        ),
                        verticalSpaceLarge
                      ],
                    ),
                    horizontalSpaceMassive,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 6),
                            child: Text(
                              'Quick Links',
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          for (var link in ['Home', 'About', 'Shop', 'Contact'])
                            MaterialInkWell(
                              paddingValue: 6,
                              radiusValue: 6,
                              onTap: () => useCase.goToPage(link),
                              child: Text(
                                link,
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .labelMedium
                                    ?.copyWith(
                                        color: AppColors.secondartTextColor),
                              ),
                            ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 6),
                            child: Text(
                              'Discover More',
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          for (var link in [
                            'FAQ',
                            'Sizing Guide',
                            'Return Policy',
                            'Contact Us'
                          ])
                            MaterialInkWell(
                              paddingValue: 6,
                              radiusValue: 6,
                              onTap: () => useCase.goToPage(link),
                              child: Text(
                                link,
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .labelMedium
                                    ?.copyWith(
                                        color: AppColors.secondartTextColor),
                              ),
                            ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 6),
                            child: Text(
                              'Stay Connected',
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          for (var link in [
                            'Instagram',
                            'Facebook',
                            'Twitter',
                            'YouTube'
                          ])
                            MaterialInkWell(
                              paddingValue: 6,
                              radiusValue: 6,
                              onTap: () => useCase.goToPage(link),
                              child: Text(
                                link,
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .labelMedium
                                    ?.copyWith(
                                        color: AppColors.secondartTextColor),
                              ),
                            ),
                        ],
                      ),
                    ),
                    MaterialInkWell(
                      onTap: () => {
                        scrollController?.animateTo(0.0,
                            duration: Duration(seconds: 1),
                            curve: Curves.easeIn)
                      },
                      child: FaIcon(
                        FontAwesomeIcons.chevronUp,
                        size: 16,
                        color: Colors.white70,
                      ),
                      padding: EdgeInsets.all(16),
                      color: AppColors.blackColor600,
                      radiusValue: 50,
                    ),
                  ],
                ),
                verticalSpaceLarge,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RegardlessTextWidget(
                      text:
                          '© $currentYear Regardless Inc. All Rights Reserved',
                      words: ['Regardless', 'Inc.', 'All Rights Reserved'],
                      wordsTextStyle: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(
                              color: Colors.black,
                              fontSize: 11,
                              fontWeight: FontWeight.w700),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.black54,
                            fontSize: 11,
                          ),
                    ),
                    TermsAndPrivacyPolicyWidget(
                      text: 'Terms of Service         Privacy Policy',
                    ),
                    Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          'visa.png',
                          'mastercard.png',
                          'momo.png',
                          'telcel.png'
                        ]
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
                            .toList())
                  ],
                )
              ]));
        },
      ),
    );
  }
}
